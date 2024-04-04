module CurrentCart
private
	def set_cart
        item = Item.find(params[:item_id])
        begin
            @cart = Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound
           @cart = nil
        end
        if @cart == nil || @cart.store_id != item.store_id
        @cart = Cart.create(customer_id: current_customer.id, store_id: item.store_id)
        session[:cart_id] = @cart.id
        end
    end
end