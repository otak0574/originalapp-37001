class StoreAddress < ApplicationRecord
  belongs_to :store, optional: true
  validates :postal_code, :pref_id, :address, :phone_number, presence: true

  validates :pref_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(- ' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pref
end
