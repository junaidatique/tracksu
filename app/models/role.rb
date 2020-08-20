class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_roles

  belongs_to :resource,
             :polymorphic => true
=begin
             :optional => true
=end

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify

  def self.without_admin
    admin_role = find_by_name 'admin'
    all - [admin_role]
  end
end
