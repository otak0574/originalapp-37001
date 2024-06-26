class CartsController < ApplicationController
  before_action :set_cart, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_customer!


  def purchase
    session[:purchase_cart_id] = params[:id] # カートアイテムのIDからカートのIDをセッションに保存
    redirect_to orders_path # 注文の新規作成ページにリダイレクト
  end

  # GET /carts or /carts.json
  def index
     @carts = current_customer.carts.not_purchased
  end

  # GET /carts/1 or /carts/1.json
  def show
    @carts = current_customer.carts.where(purchased: false)
    @cart = @carts.find_by(id: params[:id])

    unless @cart
      redirect_to root_path, alert: 'カートが見つかりません、または既に購入済みです。'
      return
    end

    @cart_items = @cart.cart_items.includes(item: :store)
    
    @stores = @cart_items.map do |cart_item|
      cart_item.item.store
    end.uniq
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @item = Item.find(params[:item_id])
    @cart = Cart.new(cart_params)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'カートが空になりました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.fetch(:cart, {}).merge(purchased: false)
    end
end
