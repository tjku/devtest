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
  it { should have_many :countries }
  it { should have_many :target_groups }

  describe 'when code is not present' do
    before { @panel_provider.code = nil }

    it { should_not be_valid }
  end

  describe 'when code is already taken' do
    before do
      panel_provider = @panel_provider.dup
      panel_provider.save
    end

    it { should_not be_valid }
  end
end
