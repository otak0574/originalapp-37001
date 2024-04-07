class AgentAddressesController < ApplicationController

  def new
    @agent_address = AgentAddress.new
  end

  def create
    @agent_address = AgentAddress.new(agent_address_params)
    if @agent_address.save
      redirect_to @agent_address, notice: 'Agent address was successfully created.'
    else
      render action: 'new'
    end
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
  def agent_address_params
    params.require(:agent_address).permit(:postal_code, :pref_id, :city, :house_number, :building_name).merge(deli_agent_id: current_deli_agent.id)
  end
end
