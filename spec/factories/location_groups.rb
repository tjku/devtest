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

FactoryBot.define do
  factory :location_group do
    name { Faker::Lorem.word }
    country
    panel_provider
  end
end
