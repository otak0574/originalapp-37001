class StoreCategory < ApplicationRecord
  validates :category_id, presence: true

  belongs_to :store, optional: true
  belongs_to :category
end
