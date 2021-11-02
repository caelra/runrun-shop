# frozen_string_literal: true

# == Schema Information
#
# Table name: cars
#
#  id            :bigint           not null, primary key
#  initial_price :decimal(10, 2)
#  model         :string
#  price         :decimal(10, 2)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'associations' do
    it { should have_many(:dealership_cars).inverse_of(:car) }
    it { should have_many(:dealerships).through(:dealership_cars) }
  end

  describe 'validations' do
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:price) }
  end

  describe 'callbacks' do
    let(:car) { build(:car) }

    it 'before_create set initial price' do
      expect(car.initial_price).to eq(nil)
      car.save
      expect(car.initial_price).to be_truthy
    end
  end
end
