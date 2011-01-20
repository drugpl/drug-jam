class VotesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :except => :create

  respond_to :html
  
  def create
    @event = Event.find(params[:event_id])
    @vote = Vote.new(params[:vote])
    @vote.submission_id, @vote.user = params[:submission_id], current_user
    authorize! :create, @vote
    @vote.save
    respond_with(@vote, :location => event_url(@event))
  end

  def destroy
    @event = Event.find(params[:event_id])
    @vote.destroy
    respond_with(@vote, :location => event_url(@event))
  end
end
