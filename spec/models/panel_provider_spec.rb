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

require 'rails_helper'

RSpec.describe PanelProvider, type: :model do
  before do
    @panel_provider = FactoryBot.build :panel_provider
  end

  subject { @panel_provider }

  it { should be_valid }
  it { should have_many(:countries).dependent(:destroy) }
  it { should have_many(:target_groups).dependent(:destroy) }
  it { should have_many(:location_groups).dependent(:destroy) }
  it { should validate_presence_of :code }
  it { should validate_uniqueness_of :code }
end
