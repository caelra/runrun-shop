# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    model { Faker::Vehicle.model }
    price { (5_000..1_000_000).to_a.sample }
  end
end
