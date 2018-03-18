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

class Country < ActiveRecord::Base
  belongs_to :panel_provider

  has_many :location_groups, dependent: :destroy
  has_many :locations, -> { uniq }, through: :location_groups

  has_many :countries_target_groups
  has_many :target_groups, through: :countries_target_groups, dependent: :destroy

  validates :panel_provider, presence: true
  validates :country_code, presence: true
end
