class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :store

  validates :name, :image, :price, :status, :details, :shelf_number, presence: true
end
