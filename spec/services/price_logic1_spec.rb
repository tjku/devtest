require 'rails_helper'

RSpec.describe PriceLogic1 do
  let(:price_logic) { PriceLogic1.new }

  subject { price_logic }

  context 'should return number of letter \'a\' divided by 100' do
    it { expect(subject.call).to eq 3.81 }
  end
end
