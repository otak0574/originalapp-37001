class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :customer
  belongs_to :store
  has_one :address
  validates :customer_id, presence: true
  validates :price, presence: true
  validates :token, presence: true
end
