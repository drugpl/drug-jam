class Event < ActiveRecord::Base
  belongs_to :organizer, :class_name => "User"
  has_many :attendances
  has_many :attendants, :through => :attendances
  has_many :submissions
  has_many :comments, :as => :commentable

  validates_presence_of :title, :description, :organizer

  scope :past, lambda { where('starting_at < ?', Time.now) }
  scope :future, lambda { where('starting_at >= ? OR starting_at IS NULL', Time.now) }

  attr_protected :organizer

  after_create :attend_by_organizer
  before_destroy :remove_organizer

  def organized_by?(user)
    self.organizer == user
  end

  def attended_by?(user)
    self.attendants.include? user
  end

  def attendance_for(user)
    self.attendances.find_by_attendant_id(user.id)
  end

  protected
  def attend_by_organizer
    self.attendants << self.organizer
  end

  def remove_organizer
    self.attendants.delete(self.organizer)
  end
end
