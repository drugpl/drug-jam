class Event < ActiveRecord::Base
  belongs_to :organizer, :class_name => "User"

  validates_presence_of :title, :description, :organizer
end
