class ItemForm
  include ActiveModel::Model
  #ItemFormクラスのオブジェクトがItemモデルの属性を扱えるようにする
  attr_accessor :name, :image, :price, :sale_price, :tag, :status, :details, :shelf_number, :category, :store_id
  validates :name, :image, :price, :status, :details, :shelf_number, presence: true

  def save
    item = Item.new(name: name, image: image, price: price, sale_price: sale_price, tag: tag, status: status, details: details, shelf_number: shelf_number, category: category, store_id: store_id)
    item.save  
  end

  def update(params, item)
    iten.update(params)
  end
end