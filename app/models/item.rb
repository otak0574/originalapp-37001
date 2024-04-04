class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :store
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations
  has_many :cart_items
  has_many :carts, through: :cart_items
  before_destroy :ensure_not_referenced_by_any_cart_item

  def ensure_not_referenced_by_any_cart_items
    unless cart_items.empty?
        errors.add(:base, '商品が存在します。')
        throw :abort
    end
end
end
