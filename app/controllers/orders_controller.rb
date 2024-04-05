class OrdersController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    purchase_cart_id = session[:purchase_cart_id]
    @cart = Cart.find_by(id: purchase_cart_id)
    unless @cart
      redirect_to root_path, alert: 'カートが見つかりません。'
      return
    end
    binding.pry
    @order_address = OrderAddress.new

  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @cart = Cart.find(order_params[:cart_id])
    @order_address = OrderAddress.new(order_params)
    @order_address.customer = current_customer
    @cart.cart_items.each do |cart_item|
      item = cart_item.item
      order_item = @order_address.order_items.build(item: item, quantity: cart_item.quantity)
    end
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :pref_id, :city, :house_number, :building_name, :phone_number, :price).merge(token: params[:token], customer_id: current_customer.id, store_id: @cart.store_id)
  end

  def address_params
    params.permit(:postal_code, :pref_id, :city, :house_number, :building_name).merge(order_id: @order.id, customer_id: current_customer.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
