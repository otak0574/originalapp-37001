class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items
  has_many :carts
  has_many :orders
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  has_one :address


  validates :nickname, :birth_date, :first_name, :last_name, presence: true
  validates :gender_id, presence: true, numericality: { only_integer: true }
  validates :first_name_kana,:last_name_kana, presence: true, format: { with: /\A[\p{katakana} ー－]+\z/, message: 'はカタカナで入力して下さい。' }
  #性別のIDが指定された範囲内にあることを検証
  validates :gender_id, inclusion: { in: 1..5, message: 'は不正な値です。' }

  def not_purchased_carts
    carts.where(purchased: false)
  end
end
