class EventsController < ApplicationController
  before_action :set_event, only: [:show, :destroy]

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to root_path
    else
      flash[:error] = @event.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
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
