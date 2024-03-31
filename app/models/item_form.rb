class ItemForm
  include ActiveModel::Model
  #ItemFormクラスのオブジェクトがItemモデルの属性を扱えるようにする
  attr_accessor(
    :name, :image, :price, :sale_price, :tag, :status, :details, 
    :shelf_number, :category, :store_id, :id, :created_at, :updated_at,
    :tag_name
    )
  validates :name, :image, :price, :status, :details, :shelf_number, presence: true

  def save
    item = Item.new(name: name, image: image, price: price, sale_price: sale_price, tag: tag, status: status, details: details, shelf_number: shelf_number, category: category, store_id: store_id)
    item.save
    if tag_name.present?
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save
      ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
    end
  end

  def update(params, item)
     #一度タグの紐付けを消す
     item.item_tag_relations.destroy_all

     #paramsの中のタグの情報を削除。同時に、返り値としてタグの情報を変数に代入
     tag_name = params.delete(:tag_name)
 
     #もしタグの情報がすでに保存されていればインスタンスを取得、無ければインスタンスを新規作成
     tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?
 
     #タグを保存
     tag.save if tag_name.present?
     item.update(params)
     ItemTagRelation.create(item_id: item.id, tag_id: tag.id) if tag_name.present?
  end
end