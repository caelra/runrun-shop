# frozen_string_literal: true

# == Schema Information
#
# Table name: dealership_cars
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  car_id        :bigint           not null
#  dealership_id :bigint           not null
#
# Indexes
#
#  index_dealership_cars_on_car_id         (car_id)
#  index_dealership_cars_on_dealership_id  (dealership_id)
#
# Foreign Keys
#
#  fk_rails_...  (car_id => cars.id)
#  fk_rails_...  (dealership_id => dealerships.id)
#
class DealershipCar < ApplicationRecord
  belongs_to :dealership
  belongs_to :car
end
