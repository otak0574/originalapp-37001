class Category < ApplicationRecord
 
  has_many :store_categories
  has_many :stores, through: :store_categories

end