class Attendance < ActiveRecord::Base
  belongs_to :attendant, :class_name => "User"
  belongs_to :event

  validates_presence_of :attendant, :event
  validates_uniqueness_of :attendant_id, :scope => :event_id

  attr_protected :attendant, :event
end
