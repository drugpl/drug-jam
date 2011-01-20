class SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  respond_to :html

  def index
    @event = Event.find(params[:event_id])
    respond_with(@submissions)
  end

  def show
    respond_with(@submission)
  end

  def new
    respond_with(@submission)
  end

  def edit
  end

  def create
    @submission.author, @submission.event_id = current_user, params[:event_id]
    @submission.save
    respond_with(@submission, :location => event_url(@submission.event))
  end

  def update
    @submission.update_attributes(params[:submission])
    respond_with(@submission, :location => event_url(@submission.event))
  end

  def destroy
    @submission.destroy
    respond_with(@submission, :location => event_url(@submission.event))
  end
end
