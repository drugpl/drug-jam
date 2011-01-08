class Submission < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  belongs_to :event

  validates_presence_of :event, :author, :title

  attr_protected :author, :event

  def authored_by?(user)
    self.author == user
  end
end
