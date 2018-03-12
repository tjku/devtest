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

class LocationGroup < ActiveRecord::Base
  belongs_to :country
  belongs_to :panel_provider

  has_many :locations_location_groups
  has_many :locations, through: :locations_location_groups

  validates :country, presence: true
  validates :panel_provider, presence: true
  validates :name, presence: true
end
