# frozen_string_literal: true

# Authorization Implementation
module Authorization
  extend ActiveSupport::Concern

  def enable_authorization(role, permit: %i[])
    return unless role.eql? current_user.role.to_sym

    not_allowed unless user_allow? permit
  end

  private

  def user_allow?(methods)
    methods.include? params[:action].to_sym
  end

  def not_allowed
    render file: 'public/404.html'
  end
end
