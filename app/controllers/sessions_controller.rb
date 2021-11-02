# frozen_string_literal: true

# Sessions Controller
class SessionsController < ApplicationController
  before_action :authorized, only: :destroy

  def new; end

  def create
    if new_session!
      redirect_to root_path, notice: t(:session_successful)
    else
      redirect_to login_path, notice: t(:session_error)
    end
  end

  def destroy
    clear_session!

    redirect_to login_path
  end
end
