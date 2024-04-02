module CurrentCart
	private
	def set_cart
	    @cart = Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound
        @cart = Cart.create(customer_id: current_customer.id)
        session[:cart_id] = @cart.id
    end
end