class CompaniesController < ApplicationController
  layout "devise"
  def new
    @company = Company.new
  end

  def create
    puts params[:email].inspect
    puts account_params.inspect
    @company = Company.new(account_params)
    @company.activated = true
    if @company.save
      user = User.new
      user.email = params[:email]
      user.name = params[:name]
      user.password = params[:password]
      user.company = @company
      if user.save
        user.add_role :director
        sign_in(user)
        redirect_to root_path, notice: 'Signed up successfully'
      else
        puts @company.errors.inspect
        puts user.errors.inspect
        #render action: 'new'
      end
    else
      #render action: 'new'
    end
  end

  private
  def account_params
    params.require(:company).permit(:title)
  end

end
