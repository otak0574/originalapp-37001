class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    if resource_class == Customer
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :phone_number, :birth_date, :gender_id, :first_name, :last_name, :first_name_kana, :last_name_kana])
    elsif resource_class == Store
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :phone_number, :business_hours, :category_id, :address, :post_number, :details, :delivery_time])
    end
  end
end
