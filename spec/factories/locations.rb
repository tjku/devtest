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

FactoryBot.define do
  factory :location do
    name { Faker::Lorem.word }
    external_id { Faker::Number.number(4) }
    secret_code { Faker::Number.number(4) }
  end
end
