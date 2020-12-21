class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :category_id, :introduction, :url, :business_hour, :address, :latitude,:longitude, :phone_number, :image])
  end
end
