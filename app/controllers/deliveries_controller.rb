class DeliveriesController < ApplicationController

  def index
    @store_address = current_deli_agent.agent_address
    @order = Order.all
  end

  def show 
    binding.pry
    @order = Order.find(params[:id])
    @cart = @order.cart
  end
end
