class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :manage, Event, :organizer_id => user.id
    can :manage, Attendance, :attendant_id => user.id
    can :manage, Submission, :author_id => user.id
    can :manage, Vote do |vote|
      vote.user == user && user.events_attended.include?(vote.submission.event)
    end
  end
end
