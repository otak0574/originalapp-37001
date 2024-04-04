class CombineItemsInCart < ActiveRecord::Migration[7.0]
  def up
    # カート内に１つの商品に対して複数のLineItemがあった場合は１つのLineItemに置き換える
    Cart.all.each do |cart|
      # カート内の各商品の数をカウントする
      sums = cart.cart_items.group(:item_id).sum(:quantity)
  
      sums.each do |item_id, quantity|
        if quantity > 1

          cart.cart_items.where(item_id: item_id).delete_all
  
          item = cart.cart_items.build(item_id: item_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end
  def down
    # 数量>1 のLineItemを複数のLineItemに分割する
    CartItem.where("quantity >1").each do |cart_item|
  
      # 個別のLineItemを追加する
      cart_item.quantity.times do
        LineItem.create(
          cart_id: cart_item.cart_id,
          item_id: cart_item.item_id,
          quantity: 1
        )
      end
  
      # 元のLineItemを削除する
      cart_item.destroy
    end
  end
end
