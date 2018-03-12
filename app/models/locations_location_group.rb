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

class LocationsLocationGroup < ActiveRecord::Base
  belongs_to :location
  belongs_to :location_group
end
