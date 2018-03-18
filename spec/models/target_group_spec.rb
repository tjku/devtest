# == Schema Information
#
# Table name: target_groups
#
#  id                :integer          not null, primary key
#  name              :string
#  external_id       :integer
#  parent_id         :integer
#  secret_code       :integer
#  panel_provider_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_target_groups_on_panel_provider_id  (panel_provider_id)
#

require 'rails_helper'

RSpec.describe TargetGroup, type: :model do
  let(:panel_provider) { FactoryBot.create :panel_provider }

  before do
    @target_group = panel_provider.target_groups.build(
      name: Faker::Lorem.word
    )
  end

  subject { @target_group }

  it { should be_valid }
  it { should belong_to :panel_provider }
  it { should have_many(:countries).dependent(:destroy) }
  it { should validate_presence_of :panel_provider }
  it { should validate_presence_of :name }

  describe 'set panel provider when parent is set' do
    before do
      parent = FactoryBot.create :target_group
      parent.children << subject
      subject.panel_provider = nil
      subject.save!
    end

    it { expect(subject.panel_provider).to eq subject.parent.panel_provider }
  end

  describe 'acts as a tree' do
    before do
      3.times do
        child = panel_provider.target_groups.create(name: Faker::Lorem.word)
        subject.children << child

        grandchild = panel_provider.target_groups.create(name: Faker::Lorem.word)
        child.children << grandchild
      end
    end

    describe '.root?' do
      it { expect(subject.root?).to be_truthy }
    end

    describe 'has 3 children' do
      it { expect(subject.children.size).to eq 3 }
    end

    describe 'has 6 descendants' do
      it { expect(subject.descendants.size).to eq 6 }
    end

    describe 'child has 2 siblings' do
      let(:child) { subject.children.first }

      it { expect(child.siblings.size).to eq 2 }
    end
  end
end
