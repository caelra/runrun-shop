# frozen_string_literal: true

# Car Depreciation Service
class CarDepreciation < ApplicationService
  DEPRECIATION = 0.02

  attr_reader :amount, :register_date

  def initialize(amount, register_date)
    @amount        = amount
    @register_date = register_date
  end

  def call
    price = amount
    months_diff(register_date).times { price *= (1 - DEPRECIATION) }

    price.round(2)
  end

  private

  def months_diff(date)
    (Time.zone.now.year * 12 + Time.zone.now.month) - (date.year * 12 + date.month)
  end
end
