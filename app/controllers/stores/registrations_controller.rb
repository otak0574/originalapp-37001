# frozen_string_literal: true

class Stores::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @store = Store.new
  end

  def new_store_address
    session_store_data = session["devise.regist_data"]["store"]
    @store = Store.new(session_store_data)
    @address = @store.build_store_address(session["devise.regist_data"]["store_address"]["store"])
    # 必要であれば、ここで他の処理を追加
  end

  def new_store_information
    session_store_data = session["devise.regist_data"]["store"]
    @store = Store.new(session_store_data)
    session_address_data = session["devise.regist_data"]["store_address"]["store"]
    @address = @store.build_store_address(session_address_data)
    @info = @store.build_store_information
  
    # 必要であれば、ここで他の処理を追加
  end
  

  def create
    @store = Store.new(sign_up_params)

     unless @store.valid?
       render :new, status: :unprocessable_entity and return
     end

    session["devise.regist_data"] = {store: @store.attributes.merge(category_ids: params[:store][:category_ids])}
    session["devise.regist_data"][:store]["password"] = params[:store][:password]
    @address = @store.build_store_address
    render :new_store_address, status: :accepted
  end

  def create_store_address
    session_store_data = session["devise.regist_data"]["store"]
    @store = Store.new(session_store_data.except("category_ids")) # category_ids を除外して Store インスタンスを作成
    @store.category_ids = session_store_data["category_ids"] if session_store_data["category_ids"].present?
    @address = StoreAddress.new(address_params)

     unless @address.valid?
       render :new_store_address, status: :unprocessable_entity and return
     end

    session["devise.regist_data"]["store_address"]= {store: @address.attributes}
    @info = @store.build_store_information
    render :new_store_information, status: :accepted
  end

  def create_store_information
    session_store_data = session["devise.regist_data"]["store"]
    @store = Store.new(session_store_data.except("category_ids")) # category_ids を除外して Store インスタンスを作成
    @store.category_ids = session_store_data["category_ids"] if session_store_data["category_ids"].present?
    @address = StoreAddress.new(session["devise.regist_data"]["store_address"]["store"])
    @info = StoreInformation.new(info_params)

     unless @info.valid?
       render :new_store_information, status: :unprocessable_entity and return
     end

     @store.build_store_address(@address.attributes)
     @store.build_store_information(@info.attributes)

    if @store.save 
      session["devise.regist_data"].clear
      sign_in(:store, @store)
      redirect_to new_item_path(@store)
    else
      render :new_store_information, status: :unprocessable_entity
    end
  end

  def edit
    @store = Store.find(params[:id])
    @store_address = @store.store_address
  end
 
  private
 
  def address_params
    params.require(:store_address).permit(:postal_code, :pref_id, :address, :phone_number)
  end

  def info_params
    params.require(:store_information).permit(:business_hours_start_id, :business_hours_end_id, :details)
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

 
   # @address_attributes = session["devise.regist_data"]["store_address"]["store"].except("id", "created_at", "updated_at")
    #  unless @category.valid?
    #    render :new_store_category, status: :unprocessable_entity and return
    #  end
    # @store.build_store_information(@info.attributes)
    # @store.save
    # @store.create_store_address!(@address.attributes)
    # @store.create_store_information!(@info.attributes)
    # session["devise.regist_data"]["store"].clear
    # session["devise.regist_data"] ["store_address"].clear
    # session["devise.regist_data"]["store_information"].clear
    # sign_in(:store, @store)
    # redirect_to publicstore_path(@store)

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
