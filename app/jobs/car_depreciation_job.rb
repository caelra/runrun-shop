# frozen_string_literal: true

# Car Depreciation Job
class CarDepreciationJob < ApplicationJob
  queue_as :default

  def perform
    return if cars_ids.empty?

    ActiveRecord::Base.transaction do
      cars_ids.each do |id|
        car = Car.find_by_id(id)

        car.update(price: depreciation(car))
      end
    end
  end

  private

  def depreciation(car)
    CarDepreciation.call(car.initial_price, car.created_at)
  end

  def cars_ids
    @cars_ids ||= Car.ids
  end
end
