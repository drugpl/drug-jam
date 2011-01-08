class EventsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  respond_to :html

  def index
    respond_with(@events)
  end

  def show
    respond_with(@event)
  end

  def new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event.organizer = current_user
    @event.save
    respond_with(@event, :location => events_url)
  end

  def update
    @event.update_attributes(params[:event])
    respond_with(@event, :location => events_url)
  end

  def destroy
    @event.destroy
    respond_with(@event, :location => events_url)
  end
end
