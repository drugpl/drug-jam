class AttendancesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  respond_to :html
  
  def new
    respond_with(@attendance)
  end
  
  def create
    @attendance.event_id, @attendance.attendant = params[:event_id], current_user
    @attendance.save
    respond_with(@attendance,  :location => events_url)
  end

  def destroy
    @attendance.destroy
    respond_with(@attendance,  :location => events_url)
  end
end
