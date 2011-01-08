class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :manage, Event, :organizer_id => user.id
    can :manage, Attendance, :attendant_id => user.id
    can :manage, Submission, :author_id => user.id
  end
end
