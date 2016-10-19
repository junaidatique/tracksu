class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  has_many :activities
  has_many :tracking_points

  def date_created
    t = Time.zone.parse(created_at)
    t.strftime("%d/%m/%Y")
  end

  def update update_params
    role_id = update_params[:role_ids]
    update_params[:password] = self.password if update_params[:password].blank?
    if has_role? :admin
      unless role_id.blank?
        role = Role.find role_id
        if role.name == 'team_member'
          # trainings.update_all deleted_at: Time.zone.now
          self.team_lead_type = nil
        end
      end
    end
    super
  end


end
