module CurrentCart
    private
	def set_cart
        begin
            @cart = Cart.find(session[:cart_id])
            # カートが購入済みかどうかを確認し、購入済みであれば@cartをnilに設定
            @cart = nil if @cart.purchased?
        rescue ActiveRecord::RecordNotFound
            @cart = nil
        end
      
        item = Item.find(params[:item_id])
      
          # カートがnil、またはカートのストアIDがアイテムのストアIDと一致しない場合
          # 新しいカートを作成するか、既存の未購入カートを検索する
        if @cart.nil? || @cart.store_id != item.store_id
            @cart = Cart.find_by(customer_id: current_customer.id, store_id: item.store_id, purchased: false) || Cart.create(customer_id: current_customer.id, store_id: item.store_id)
            session[:cart_id] = @cart.id
        end
    end
end