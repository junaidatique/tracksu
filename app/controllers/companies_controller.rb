class CompaniesController < ApplicationController
  layout "devise"

  def index
    redirect_to new_company_path
  end

  def new
    @company = Company.new
    @company.users.new
  end

  def create
    @company = Company.new account_params
    #@company.users.first.user_id = current_user_id
    if @company.save
      user = @company.users.first
      user.add_role :director
      sign_in user
      redirect_to tracksu_user_path current_user
    else
      render :action => :new
    end
  end


  private
  def account_params
    params.require(:company).permit( :title, users_attributes: [:name, :email, :password, :password_confirmation])
  end

end
