class EventsController < ApplicationController
  # before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :time)
  end
end
