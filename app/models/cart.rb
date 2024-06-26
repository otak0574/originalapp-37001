class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  belongs_to :customer
	belongs_to :store
	has_one :order

	scope :not_purchased, -> { where(purchased: false) }

  def add_item(item)
		current_item = cart_items.find_by(item_id: item.id)
		if current_item
			current_item.quantity += 1
		else
			current_item = cart_items.build(item_id: item.id)
		end
		current_item
	end

	def total_price
		cart_items.to_a.sum {|item| item.total_price }
	end
end
