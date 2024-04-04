module CurrentCart
private
	def set_cart
        begin
            @cart = Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound
           @cart = nil
        end
        item = Item.find(params[:item_id])
        if @cart == nil || @cart.store_id != item.store_id
        @cart = Cart.find_by(customer_id: current_customer.id, store_id: item.store_id) || Cart.create(customer_id: current_customer.id, store_id: item.store_id)
        session[:cart_id] = @cart.id
        end
    end
end