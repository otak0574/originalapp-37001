class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  belongs_to :customer

  def add_item(item)
		current_item = cart_items.find_by(item_id: item.id)
		if current_item
			current_item.quantity += 1
		else
			current_item = cart_items.build(item_id: item.id)
		end
		current_item
	end
end
