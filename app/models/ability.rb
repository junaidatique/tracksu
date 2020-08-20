class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud
    alias_action :index, :read, :update, :destroy, to: :irud
    alias_action :index, :read, :update, to: :iru
    alias_action :index, :read, to: :ir
    alias_action :read, :update, :destroy, to: :rud

    if user.has_role? :admin
      can :manage, :all

    elsif user.has_role? :director
      can :create, User
      can :iru, User, company_id: user.company_id
      can :destroy, User do |user_destroy|
          user_destroy.company_id == user.company_id and user_destroy.id != user.id
      end
      can :change_password, User, :id => user.id
      can :update_password, User, :id => user.id

      can :create, Product
      can :irud, Product, :company_id => user.company_id

      can :create, Purpose
      can :irud, Purpose, company_id: user.company_id
      can :create, Place
      can :irud, Place, company_id: user.company_id
      can :irud, Place, company_id: user.company_id

      can :create, Activity
      can :irud, Activity, user_id: user.company.users.map(&:id)
      can :create, TrackingPoint
      can :ir, TrackingPoint, user_id: user.id


    elsif user.has_role? :manager
      can :create, User
      can [:index, :read], User, :company_id => user.company_id
      can :update, User do |user_update|
        user_update.company_id == user.company_id and !user_update.has_role? :director
      end
      can :destroy, User do |user_destroy|
        user_destroy.company_id == user.company_id and user_destroy.id != user.id and user_destroy.has_role? :sale_user
      end
      can :change_password, User, :id => user.id
      can :update_password, User, :id => user.id

      can :create, Product
      can :irud, Product, :company_id => user.company_id

      can :create, Place
      can :iru, Place, company_id: user.company_id

      can :create, Activity
      can :irud, Activity, user_id: user.company.users.map(&:id)

      can :read, Purpose, company_id: user.company_id

      can :create, TrackingPoint
      can :ir, TrackingPoint, user_id: user.id

    elsif user.has_role? :sale_user
      can :index, Product, :company_id => user.company_id
      can :read, User, id: user.id
      can :change_password, User, :id => user.id
      can :update_password, User, :id => user.id

      can :create, Place
      can :iru, Place, company_id: user.company_id

      can :create, Activity
      can :iru, Activity, user_id: user.id
      can :index, Purpose, company_id: user.company_id

      can :create, TrackingPoint
      can :ir, TrackingPoint, user_id: user.id

    else
      can :read, :user

    end

  end
end



