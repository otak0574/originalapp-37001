module CurrentCart
    extend ActiveSupport::Concern
  
    private
  
    def set_cart
      begin
        # sessionに保存されているcart_idを使用してカートを見つける
        @cart = Cart.find(session[:cart_id]) if session[:cart_id]
      rescue ActiveRecord::RecordNotFound
        @cart = nil
      end
  
      # item_idからアイテムを見つける
      item = Item.find(params[:item_id]) if params[:item_id]
  
      if @cart.nil? || @cart.purchased || @cart.store_id != item.store_id || @cart.customer_id != current_customer.id
        # 該当するカートが存在しない、もしくは購入済み、またはstore_idが一致しない、またはcustomer_idが一致しない場合は新しいカートを作成
        @cart = Cart.create(customer_id: current_customer.id, store_id: item.store_id, purchased: false)
  
        # 新しいカートをsessionに保存
        session[:cart_id] = @cart.id
      end
    end
  end
  