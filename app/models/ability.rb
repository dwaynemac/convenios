class Ability
  include CanCan::Ability

  def initialize(user)
    cannot :manage, :all

    can :read, Deal

    if user
      can :create, Deal
      can :create, Business
      can :update, Deal, responsible_user: user.username

      if user.username == 'dwayne.macgowan'
        can :manage, :all
      end
    end
  end
end
