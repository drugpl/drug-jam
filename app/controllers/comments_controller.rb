class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :setup_commentable, :except => :destroy
  load_and_authorize_resource

  respond_to :html

  def new
    @comment.commentable = @commentable
    respond_with(@comment)
  end

  def create
    @comment.commentable, @comment.author = @commentable, current_user
    @comment.save
    respond_with(@comment, :location => polymorphic_url([@event, @submission]))
  end

  def destroy
    @comment.destroy
    respond_with(@comment, :location => polymorphic_url([@event, @submission]))
  end

  protected
  def setup_commentable
    @event = Event.find(params[:event_id]) if params[:event_id]
    @submission = Submission.find(params[:submission_id]) if params[:submission_id]
    @commentable = @submission || @event
  end
end
