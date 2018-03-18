# == Schema Information
#
# Table name: location_groups
#
#  id                :integer          not null, primary key
#  name              :string
#  country_id        :integer
#  panel_provider_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_location_groups_on_country_id         (country_id)
#  index_location_groups_on_panel_provider_id  (panel_provider_id)
#

require 'rails_helper'

RSpec.describe LocationGroup, type: :model do
  before do
    @location_group = FactoryBot.build :location_group
  end

  subject { @location_group }

  it { should be_valid }
  it { should belong_to :country }
  it { should belong_to :panel_provider }
  it { should have_many(:locations).dependent(:destroy) }
  it { should validate_presence_of :country }
  it { should validate_presence_of :name }

  describe 'set panel provider when country is set' do
    before do
      subject.panel_provider = nil
      subject.save!
    end

    it { expect(subject.panel_provider).to eq subject.country.panel_provider }
  end
end
