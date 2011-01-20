class AttendancesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :setup_event
  load_and_authorize_resource

  respond_to :html
  
  def new
    respond_with(@attendance)
  end
  
  def create
    @attendance.event_id, @attendance.attendant = params[:event_id], current_user
    @attendance.save
    respond_with(@attendance,  :location => event_url(@event))
  end

  def destroy
    @attendance.destroy
    respond_with(@attendance,  :location => event_url(@event))
  end

  protected
  def setup_event
    @event = Event.find(params[:event_id]) if params[:event_id]
  end
end
