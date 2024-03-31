class Category < ApplicationRecord
 
  has_many :store_categories
  has_many :stores, through: :store_categories

  def self.setup_initial_categories
    categories = [
      '食料品', '調味料', 'お酒', '備蓄食料', '日用品', 'ギフト', 'お菓子', 'デザート', '化粧品', 'お子様', 'ペット', 'その他'
    ]

    categories.each do |name|
      Category.find_or_create_by(name: name)
    end
  end
end