# == Schema Information
#
# Table name: countries_target_groups
#
#  id              :integer          not null, primary key
#  country_id      :integer
#  target_group_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_countries_target_groups_on_country_id       (country_id)
#  index_countries_target_groups_on_target_group_id  (target_group_id)
#

FactoryBot.define do
  factory :countries_target_group do
    country
    target_group
  end
end
