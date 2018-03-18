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
    country_code { Faker::Address.country_code }
    panel_provider

    after :create do |country|
      create_list :location_group, 2, country: country, panel_provider: country.panel_provider
    end
  end
end
