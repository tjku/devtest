require 'rails_helper'

RSpec.describe PriceLogic2 do
  let(:price_logic) { PriceLogic2.new }

  subject { price_logic }

  context 'should return number of large arrays (above 10 elements)' do
    it { expect(subject.call).to eq 90 }
  end
end
