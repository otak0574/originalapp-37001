class StoreAddress < ApplicationRecord
  belongs_to :store, optional: true
  validates :postal_code, :pref_id, :address, :phone_number, presence: true
  validates :pref_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pref
end
