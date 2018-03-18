# == Schema Information
#
# Table name: countries
#
#  id                :integer          not null, primary key
#  country_code      :string
#  panel_provider_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_countries_on_panel_provider_id  (panel_provider_id)
#

require 'rails_helper'

RSpec.describe Country, type: :model do
  before do
    @country = FactoryBot.build :country
  end

  subject { @country }

  it { should be_valid }
  it { should belong_to :panel_provider }
  it { should have_many(:target_groups).dependent(:destroy) }
  it { should have_many(:location_groups).dependent(:destroy) }
  it { should validate_presence_of :panel_provider }
  it { should validate_presence_of :country_code }
  it { should validate_uniqueness_of(:country_code).scoped_to(:panel_provider_id).case_insensitive }
end
