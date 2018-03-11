# == Schema Information
#
# Table name: target_groups
#
#  id                :integer          not null, primary key
#  name              :string
#  external_id       :integer
#  parent_id         :integer
#  secret_code       :integer
#  panel_provider_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_target_groups_on_panel_provider_id  (panel_provider_id)
#

FactoryBot.define do
  factory :target_group do
    name { Faker::Lorem.word }
    external_id { Faker::Number.number(4) }
    secret_code { Faker::Number.number(4) }
    panel_provider
  end
end
