# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user!

  def user_not_authorized
    Rails.logger << '========== Not authorized! ==========='
    flash[:alert] = I18n.t('authorization_error')
    redirect_to(request.referer || root_path)
  end
end
