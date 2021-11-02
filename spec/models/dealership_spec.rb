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
require 'rails_helper'

RSpec.describe Dealership, type: :model do
  describe 'associations' do
    it { should have_many(:dealership_cars).dependent(:destroy) }
    it { should have_many(:cars).through(:dealership_cars) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
