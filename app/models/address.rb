class Address < ApplicationRecord
  belongs_to :order
  belongs_to :customer

  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # 0以外の整数を許可する
  validates :pref_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は不正な値です。' }
end
