class Submission < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  belongs_to :event
  has_many :votes
  has_many :users_voted, :through => :votes, :source => :user
  has_many :comments, :as => :commentable

  validates_presence_of :event, :author, :title

  attr_protected :author, :event
  
  def authored_by?(user)
    self.author == user
  end

  def voted_by?(user)
    self.users_voted.include? user
  end

  def vote_for(user)
    self.votes.find_by_user_id(user.id)
  end
end
