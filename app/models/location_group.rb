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
  has_many :locations, through: :locations_location_groups, dependent: :destroy

  validates :country, presence: true
  validates :name, presence: true

  before_validation :set_panel_provider

  private

  def set_panel_provider
    self.panel_provider ||= country.panel_provider if country.present?
  end
end
