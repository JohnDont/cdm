class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).concat [:full_name, :username, :gender]
    devise_parameter_sanitizer.for(:account_update).concat [
      :full_name, :username, :gender, :website, :facebook_url, :twitter_url,
      :instagram_url, :youtube_url, :soundcloud_url, :avatar, :avatar_cache]
  end
end
