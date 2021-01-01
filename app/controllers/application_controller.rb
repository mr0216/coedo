class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :category_id, :introduction, :url, :business_hour, :address, :latitude, :longitude, :phone_number, :image])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, _password|
      username == ENV['BASIC_AUTH_USER'] && ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
