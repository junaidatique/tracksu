class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, :to => :crud

    if user.has_role? :admin
      can :manage, :all

    elsif user.has_role? :director
      can :create, User
      can :index, User, :company_id => user.company_id
      can :read, User, :company_id => user.company_id
      can :update, User, :company_id => user.company_id
      can :destroy, User, :company_id => user.company_id
      cannot :crud, Company
    elsif user.has_role? :manager
      can :create, User
      can :index, User, :company_id => user.company_id
      can :read, User, :company_id => user.company_id
      can :update, User, :company_id => user.company_id
      can :destroy, User, :company_id => user.company_id

     can :read, Product, :company_id => user.company_id


    elsif user.has_role? :sale_user
      can :crud, :user


    else
      can :read, :user

    end

  end
end



