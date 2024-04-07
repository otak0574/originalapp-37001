module CurrentCart
    extend ActiveSupport::Concern
  
    private
  
    def set_cart
        store_id = params[:store_id] || session[:last_visited_store_id]
        @current_cart = Cart.find_or_initialize_by(customer_id: current_customer.id, store_id: store_id, purchased: false)
        
        if @current_cart.new_record?
            @current_cart.save
            session[:last_visited_store_id] = store_id
        end
        @cart = Cart.find_by(customer_id: current_customer.id, store_id: store_id, purchased: false)

        unless @cart
          @cart = Cart.create(customer_id: current_customer.id, store_id: store_id, purchased: false)
        end
      
        @cart
    end
  end
  