class OrdersController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    purchase_cart_id = session[:purchase_cart_id]
    @cart = Cart.find_by(id: purchase_cart_id)
    unless @cart
      redirect_to root_path, alert: 'カートが見つかりません。'
      return
    end
    @order_address = OrderAddress.new
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    purchase_cart_id = session[:purchase_cart_id]
    @cart = Cart.find_by(id: purchase_cart_id)
    @order_address = OrderAddress.new(order_params)
    @order_address.customer_id = current_customer.id
    binding.pry
    if @order_address.valid?
      pay_item
      if @order_address.save
        session.delete(:purchase_cart_id)
        return redirect_to root_path
      else
        flash.now[:alert] = '購入処理に失敗しました。'
        render :index, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = '入力に誤りがあります。'
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
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
