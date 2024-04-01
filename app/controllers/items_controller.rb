class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show]

  def index
    @items = Item.all
  end

  def new
    @item_form = ItemForm.new
  end

  def create
    @item_form = ItemForm.new(item_form_params)
    if @item_form.valid?
      @item_form.save
      redirect_to items_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @store = Store.find(params[:id])
    @items = @store.items
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
      redirect_to items_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def item_form_params
    params.require(:item_form).permit(:name, :image, :price, :sale_price, :tag_name, :status, :details, :shelf_number, :category).merge(store_id: current_store.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
