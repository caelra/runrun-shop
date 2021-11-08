# frozen_string_literal: true

# Dealerships Controller
class DealershipCarsController < ApplicationController
  before_action :authorized

  before_action do
    enable_authorization :admin, permit: %i[index show new edit create update destroy]
    enable_authorization :user, permit: %i[]
  end

  before_action :set_dealership_car, only: %i[show edit update destroy]

  def index
    @dealership_cars = DealershipCar.price_descending
  end

  def show; end

  def new
    @dealership_car = DealershipCar.new
  end

  def edit; end

  def create
    @dealership_car = DealershipCar.new(dealership_car_params)

    if @dealership_car.save
      redirect_to @dealership_car, notice: 'DealershipCar was successfully created.'
    else
      render :new, notice: 'Something happened.'
    end
  end

  def update
    if @dealership_car.update(dealership_car_params)
      redirect_to @dealership_car, notice: 'DealershipCar was successfully updated.'
    else
      render :edit, notice: 'Something happened.'

    end
  end

  def destroy
    @dealership_car.destroy

    redirect_to dealerships_url, notice: 'DealershipCar was successfully destroyed.'
  end

  private

  def set_dealership_car
    @dealership_car = DealershipCar.find(params[:id])
  end

  def dealership_car_params
    params.require(:dealership_car).permit(:dealership_id, :car_id, :price)
  end
end
