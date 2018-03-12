# == Schema Information
#
# Table name: countries_target_groups
#
#  id              :integer          not null, primary key
#  country_id      :integer
#  target_group_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_countries_target_groups_on_country_id       (country_id)
#  index_countries_target_groups_on_target_group_id  (target_group_id)
#

require 'rails_helper'

RSpec.describe CountriesTargetGroup, type: :model do
  before do
    @countries_target_group = FactoryBot.build :countries_target_group
  end

  subject { @countries_target_group }

  it { should be_valid }
  it { should belong_to :country }
  it { should belong_to :target_group }
  it { should validate_presence_of :country }
  it { should validate_presence_of :target_group }

  describe 'allow only target group roots' do
    let(:root) { FactoryBot.create :target_group }
    let(:child) { FactoryBot.create :target_group }
    before do
      root.children << child
      subject.target_group = child
    end

    it { should_not be_valid }
  end
end
