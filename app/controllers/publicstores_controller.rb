class PublicstoresController < ApplicationController
  before_action :authenticate_store!,except: [:index, :show]

  def index
    @stores = Store.includes(:store_information).all
  end

  def new
  end

  def show
    @store = Store.find(params[:id])
    session[:last_visited_store_id] = @store.id
    @items = @store.items
  end

  def edit
    # 実装内容
  end

  def update
    # 実装内容
  end
  
private

  def store_params
    # params.require(:store).permit(:image, :name, :description, :category_id, :spec_id, :shipping_fee_id, :pref_id,
    # :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end
