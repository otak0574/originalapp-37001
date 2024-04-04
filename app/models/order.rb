class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :user
  belongs_to :store
  validates :user_id, presence: true
  validates :price, presence: true
  validates :token, presence: true
end
