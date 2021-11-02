require 'rails_helper'

describe CarDepreciation do
  let(:user) { create(:user) }

  describe '#initialize' do
    it 'initialize a credit transaction successfully' do
      payload = { amount: 100, register_date: 5.months.ago }
      car_depreciation = CarDepreciation.new(payload[:amount], payload[:register_date])

      expect(car_depreciation).not_to eq nil
    end
  end

  describe '#call' do
    it 'perform a call successfully' do
      payload = { amount: 100, register_date: 5.months.ago }
      car_depreciation = CarDepreciation.call(payload[:amount], payload[:register_date])

      expect(car_depreciation).to be_truthy
    end

    it 'perform a call unsuccessful' do
      payload = { amount: 100, register_date: 5.months.ago }
      car_depreciation = CarDepreciation.call(payload[:amount], payload[:register_date])

      expect(car_depreciation).to be_a Float
    end
  end
end
