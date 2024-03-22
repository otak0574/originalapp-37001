class StoreInformation < ApplicationRecord
  belongs_to :store, optional: true
  
end
