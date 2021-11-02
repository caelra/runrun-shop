# frozen_string_literal: true

# Authentication implementation
module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :logged_in?, :current_user, :super_user?
  end

  def new_session!
    return unless authorize_user_login

    session[:user_id] = user.id
  end

  def clear_session!
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def super_user?
    current_user&.admin?
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  private

  def authorize_user_login
    user && user_authenticate
  end

  def user_authenticate
    user&.authenticate(params[:sessions][:password])
  end

  def user
    @user ||= User.find_by(email: params[:sessions][:email])
  end
end
