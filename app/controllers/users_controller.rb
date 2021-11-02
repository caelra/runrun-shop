# frozen_string_literal: true

# Users Controller
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    return redirect :new unless @user.valid?

    @user.save
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
