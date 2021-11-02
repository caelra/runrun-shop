# frozen_string_literal: true

# Home Controller
class HomeController < ApplicationController
  before_action :set_collection

  def index; end

  private

  def set_collection
    @object_collection = DealershipCar.all
  end
end
