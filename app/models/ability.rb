class Ability
  include CanCan::Ability

  def initialize(user)
    cannot :manage, :all

    can :read, Deal
    can :read, Business

    if user
      can :create,  Deal
      can :update,  Deal, responsible_user: user.username
      can :destroy, Deal, responsible_user: user.username

      can :create,  Business
      can :update,  Business do |business|
        user.in?(business.deals.map(&:user))
      end

      if user.username == 'dwayne.macgowan'
        can :manage, :all
      end
    end
  end
end
