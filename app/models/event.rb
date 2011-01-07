class Event < ActiveRecord::Base
  belongs_to :organizer, :class_name => "User"
  has_many :attendances
  has_many :attendants, :through => :attendances

  validates_presence_of :title, :description, :organizer

  after_create :attend_by_organizer

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
end
