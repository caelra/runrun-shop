# frozen_string_literal: true

# Cars Controller
class CarsController < ApplicationController
  before_action :authorized

  before_action do
    enable_authorization :admin, permit: %i[index show new edit create update destroy]
    enable_authorization :user, permit: %i[]
  end

  before_action :set_object, only: %i[show edit update destroy]

  def index
    @cars = Car.all
  end

  def show; end

  def new
    @car = Car.new
  end

  def edit; end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to @car, notice: 'Car was successfully created.'
    else
      render :new, notice: 'Something happened.'
    end
  end

  def update
    if @car.update(car_params)
      redirect_to @car, notice: 'Car was successfully updated.'
    else
      render :edit, notice: 'Something happened.'
    end
  end

  def destroy
    @car.destroy

    redirect_to cars_url, notice: 'Car was successfully destroyed.'
  end

  private

  def set_object
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:model, :price)
  end
end
