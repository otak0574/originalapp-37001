# frozen_string_literal: true

class Stores::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(sign_up_params)
     unless @store.valid?
       render :new, status: :unprocessable_entity and return
     end
    session["devise.regist_data"] = {store: @store.attributes}
    session["devise.regist_data"][:store]["password"] = params[:store][:password]
    @address = @store.build_store_address
    render :new_store_address, status: :accepted
  end

  def create_store_address
    @store = Store.new(session["devise.regist_data"]["store"])
    @address = StoreAddress.new(address_params)
     unless @address.valid?
       render :new_store_address, status: :unprocessable_entity and return
     end
    @store.build_store_address(@address.attributes)
    @store.save
    session["devise.regist_data"]["store"].clear
    sign_in(:store, @store)
    redirect_to publicstore_path(@store)
  end

  def create_store_infomation
  end
 
  private
 
  def address_params
    params.require(:store_address).permit(:postal_code, :pref_id, :address, :phone_number)
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
