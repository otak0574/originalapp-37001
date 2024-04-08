class AddressesController < ApplicationController


  def new
    @address = Address.new
  end

  def create
    binding.pry
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path, notice: 'address was successfully created.'
    else
      render action: 'new'
    end
  end

  def show

  end

  def edit
    @address = Address.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :pref_id, :city, :house_number, :building_name, :phone_number).merge(customer_id: current_customer.id)
  end
end
