class StoreInformation < ApplicationRecord
  belongs_to :store, optional: true
  validates :details, :business_hours_start_id, :business_hours_end_id, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :business_hours_start, class_name: 'Hour'
  belongs_to :business_hours_end, class_name: 'Hour'
end
