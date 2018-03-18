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

require 'rails_helper'

RSpec.describe Location, type: :model do
  before do
    @location = FactoryBot.build :location
  end

  subject { @location }

  it { should be_valid }
  it { should have_many(:location_groups).dependent(:destroy) }
  it { should validate_presence_of :name }
end
