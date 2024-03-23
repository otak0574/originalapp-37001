class StoreInformation < ApplicationRecord
  belongs_to :store, optional: true
  validates :business_hours, :details, presence: true
end
