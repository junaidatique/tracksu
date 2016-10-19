class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :name, presence: true

  belongs_to :company
  has_many :activities

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
        if role.name == 'sale_user'
          # trainings.update_all deleted_at: Time.zone.now
          self.admin_type = nil
        end
      end
    end
    super
  end


end
