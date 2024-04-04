class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show]

  def index
    @items = Item.all
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  def new
    @item_form = ItemForm.new
  end

  def create
    @item_form = ItemForm.new(item_form_params)
    if @item_form.valid?
      @item_form.save
      redirect_to publicstore_path(current_store)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @store_id = @item.store_id
    @items =  Item.where(store_id: @store_id)
  end

  def edit
    item_attributes = @item.attributes
    @item_form = ItemForm.new(item_attributes)
    @item_form.tag_name = @item.tags.first&.tag_name
  end

  def update
    @item_form = ItemForm.new(item_form_params)

      # 画像を選択し直していない場合は、既存の画像をセットする
      @item_form.image ||= @item.image.blob

    if @item_form.valid?
      @item_form.update(item_form_params, @item)
      redirect_to publicstore_path(current_store)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def item_form_params
    params.require(:item_form).permit(:name, :tag_name, :image, :price, :sale_price, :status, :details, :shelf_number, :category).merge(store_id: current_store.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
