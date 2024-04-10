class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if store_signed_in?
      publicstore_path(current_store)
    elsif deli_agent_signed_in?
      deliveries_path(current_deli_agent)
    else
      root_path
    end
  end

  private
  def configure_permitted_parameters
    if resource_class == Customer
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birth_date, :gender_id, :first_name, :last_name, :first_name_kana, :last_name_kana])
    elsif resource_class == Store
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,{ category_ids: [] }, :image])
    elsif resource_class == DeliAgent
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :phone_number, :birth_date, :gender_id, :first_name, :last_name, :first_name_kana, :last_name_kana])
    end
  end
end
