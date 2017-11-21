class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper

  private

  def login_user
    redirect_to new_user_path unless user_signed_in?
  end

  def deliver_request
    if user_signed_in?
      return if current_user.friend_requests.yet.blank?
      # flash 入れる？
      redirect_to new_authenticate_path
    end
  end
end
