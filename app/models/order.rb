class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :customer
  belongs_to :store
  belongs_to :cart
end
