class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :submission

  validates_presence_of :user, :submission
  validates_uniqueness_of :user_id, :scope => :submission_id
end
