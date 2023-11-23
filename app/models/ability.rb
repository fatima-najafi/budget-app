class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here.
    # For example, allow users with the role 'admin' to manage all resources.
    if user.admin?
      can :manage, :all
    else
      # Define other rules for non-admin users here.
      return unless user.present?

      can :manage, Category, author: user
      can :manage, Exchange, author: user
    end
  end
end
