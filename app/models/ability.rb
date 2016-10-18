class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, :to => :crud

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :manager
      can :crud, :user

    elsif user.has_role? :sale_user

    else
      can :read, :user
    end

  end
end



