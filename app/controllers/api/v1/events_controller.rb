class Api::V1::EventsController < ApplicationController
  def index
    render json: Event.all
  end

  def create
    event = Event.new(event_params)
    if event.valid?
      event.save
      render json: { event: event, success: "#{event.name} has been created" }
    else
      render json: { failure: event.errors.messages }
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start, :end)
  end
end
