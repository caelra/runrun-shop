# frozen_string_literal: true

# == Schema Information
#
# Table name: dealerships
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Dealership < ApplicationRecord
  has_many :dealership_cars, dependent: :destroy
  has_many :cars, through: :dealership_cars

  validates :name, presence: true
end
