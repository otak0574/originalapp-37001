class ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def new

  end

  def create

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :sale_price, :tag_id, :shelf_number, :category_id).merge(store_id: current_store.id)
    
  end
end
