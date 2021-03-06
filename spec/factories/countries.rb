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

FactoryBot.define do
  factory :country do
    sequence(:country_code) { |n| "#{Faker::Address.country_code}-#{n}" }
    panel_provider

    after :create do |country|
      create_list :location_group, 2, country: country, panel_provider: country.panel_provider
      country.target_groups << create_list(:target_group, 5, panel_provider: country.panel_provider)
    end
  end
end
