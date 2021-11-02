# frozen_string_literal: true

# Dealerships Controller
class DealershipsController < ApplicationController
  before_action :authorized

  before_action do
    enable_authorization :admin, permit: %i[index show new edit create update destroy]
    enable_authorization :user, permit: %i[]
  end

  before_action :set_dealership, only: %i[show edit update destroy]

  def index
    @dealerships = Dealership.all
  end

  def show; end

  def new
    @dealership = Dealership.new
  end

  def edit; end

  def create
    @dealership = Dealership.new(dealership_params)

    if @dealership.save
      redirect_to @dealership, notice: 'Dealership was successfully created.'
    else
      render :create, notice: 'Something happened.'
    end
  end

  def update
    if @dealership.update(dealership_params)
      redirect_to @dealership, notice: 'Dealership was successfully updated.'
    else
      render :edit, notice: 'Something happened.'
    end
  end

  def destroy
    @dealership.destroy

    redirect_to dealerships_url, notice: 'Dealership was successfully destroyed.'
  end

  private

  def set_dealership
    @dealership = Dealership.find(params[:id])
  end

  def dealership_params
    params.require(:dealership).permit(:name)
  end
end
