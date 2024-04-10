class DeliveriesController < ApplicationController

  def index
    @store_address = current_deli_agent.agent_address
    @order = Order.all
  end

  def show 
    order = Order.find(params[:id])
    @cart = order.cart
  end
end
