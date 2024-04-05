class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :customer
  belongs_to :store
  has_one :address
  validates :customer_id, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: "is invalid"}
  validates :token, presence: true
end
