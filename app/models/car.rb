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
class Car < ApplicationRecord
  has_many :dealership_cars, inverse_of: :car
  has_many :dealerships, through: :dealership_cars

  validates :model, presence: true
  validates :price, presence: true

  before_create { self.initial_price = price }
end
