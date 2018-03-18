# == Schema Information
#
# Table name: panel_providers
#
#  id         :integer          not null, primary key
#  code       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_panel_providers_on_code  (code) UNIQUE
#

FactoryBot.define do
  factory :panel_provider do
    sequence(:code)

    after :create do |panel_provider|
      create_list :country, 3, panel_provider: panel_provider
    end
  end
end
