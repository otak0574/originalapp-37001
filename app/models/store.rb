class Store < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         validates :name, :business_hours, :category_id, :post_number, :address, :delivery_time, :phone_number, presence: true
         #電話番号のフォーマットを検証
         validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁の数字のみです" } 
         #郵便番号のフォーマットを検証
         validates :post_number, format: { with: /\A\d{3}-\d{4}\z/, message: "は不正な形式です" }
       
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # has_many :categories
  # accepts_nested_attributes_for :categories
  has_many :store_categories
  has_many :categories, through: :store_categories
end
