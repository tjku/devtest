# == Schema Information
#
# Table name: locations_location_groups
#
#  id                :integer          not null, primary key
#  location_id       :integer
#  location_group_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_locations_location_groups_on_location_group_id  (location_group_id)
#  index_locations_location_groups_on_location_id        (location_id)
#

require 'rails_helper'

RSpec.describe LocationsLocationGroup, type: :model do
  before do
    @locations_location_group = FactoryBot.build :locations_location_group
  end

  subject { @locations_location_group }

  it { should be_valid }
  it { should belong_to :location }
  it { should belong_to :location_group }
end
