module CurrentCart
    private
  
    def set_cart
      if session[:cart_id]
        begin
          # sessionに保存されているcart_idを使用してカートを見つける
          @cart = Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound
          @cart = nil
        end
      end
  
      # sessionにカートがない、もしくは見つけたカートが購入済みの場合、新しいカートを探すか作成する
      if @cart.nil? || @cart.purchased
        item = Item.find(params[:item_id])
        # purchasedがnilかfalseで、かつcustomer_idとstore_idが一致するカートを探す
        @cart = Cart.find_by(customer_id: current_customer.id, store_id: item.store_id, purchased: [nil, false])
  
        # 該当するカートが存在しない場合は新しいカートを作成
        @cart ||= Cart.create(customer_id: current_customer.id, store_id: item.store_id)
  
        # 新しいカートをsessionに保存
        session[:cart_id] = @cart.id
      end
    end
  end
  