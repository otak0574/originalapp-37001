class ItemsController < ApplicationController

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
    @item = Item.find(params[:id])
  end

  def edit
    item_attributes = @item.attributes
    @item_form = ItemForm.new(item_attributes)
  end

  def update
    @item_form = ItemForm.new(item_form_params)
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
    params.require(:item_form).permit(:name, :image, :price, :sale_price, :tag, :status, :details, :shelf_number, :category).merge(store_id: current_store.id)
  end
end
