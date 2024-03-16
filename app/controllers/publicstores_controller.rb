class PublicstoresController < ApplicationController
  before_action :authenticate_store!,except: [:index]

  def index
    @store = Store.all
  end

  def new
  end

  def show
    # 実装内容
  end

  def edit
    # 実装内容
  end

  def update
    # 実装内容
  end
  
end
