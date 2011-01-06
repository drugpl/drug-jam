class EventsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def index
    respond_with(@events = Event.all)
  end

  def show
    respond_with(@event = Event.find(params[:id]))
  end

  def new
    respond_with(@event = Event.new)
  end

  def edit
    respond_with(@event = Event.find(params[:id]))
  end

  def create
    @event = Event.create(params[:event].merge(:organizer_id => current_user.id))
    respond_with(@event, :location => events_url)
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event].except(:organizer_id))
    respond_with(@event, :location => events_url)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    respond_with(@event, :location => events_url)
  end
end
