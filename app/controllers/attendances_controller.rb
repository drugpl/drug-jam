class AttendancesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  respond_to :html
  
  def new
    respond_with(@attendance)
  end
  
  def create
    @attendance.update_attributes(:event_id => params[:event_id], :attendant_id => current_user.id)
    respond_with(@attendance,  :location => events_url)
  end

  def destroy
    @attendance.destroy
    respond_with(@attendance,  :location => events_url)
  end
end
