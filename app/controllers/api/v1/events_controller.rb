class Api::V1::EventsController < ApplicationController

  def create
    
  end

  private
  def event_params
    params.require(:event).permit(:name)
  end
end