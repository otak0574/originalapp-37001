class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :store
  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations
end
