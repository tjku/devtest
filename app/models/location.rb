# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  name        :string
#  external_id :integer
#  secret_code :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Location < ActiveRecord::Base
  has_many :locations_location_groups
  has_many :location_groups, through: :locations_location_groups, dependent: :destroy

  validates :name, presence: true
end
