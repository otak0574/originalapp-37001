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


  validates :nickname, :phone_number, :birth_date, :first_name, :last_name, presence: true
  validates :gender_id, presence: true, numericality: { only_integer: true }
  validates :first_name_kana,:last_name_kana, presence: true, format: { with: /\A[\p{katakana} ー－]+\z/, message: 'はカタカナで入力して下さい。' }

  #電話番号の形式を検証
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は不正な値です。' }

  #性別のIDが指定された範囲内にあることを検証
  validates :gender_id, inclusion: { in: 1..3, message: 'は不正な値です。' }
end
