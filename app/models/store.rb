class Store < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,presence: true
  has_one_attached :image
  has_one :store_address
  has_one :store_information
  has_many :store_categories
  has_many :categories, through: :store_categories
  has_many :items
  has_many :carts
  has_many :orders
end
