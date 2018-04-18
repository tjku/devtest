require 'rails_helper'

RSpec.describe PriceLogic3 do
  let(:price_logic) { PriceLogic3.new }

  subject { price_logic }

  context 'should return number of HTML nodes divided by 100' do
    it { expect(subject.call).to eq 10.18 }
  end
end
