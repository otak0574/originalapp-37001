class DeliveriesController < ApplicationController

  def index
    @full_agent_address = current_deli_agent.agent_address
  end
end
