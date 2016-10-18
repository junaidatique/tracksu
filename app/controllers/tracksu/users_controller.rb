class Tracksu::UsersController < Tracksu::TracksuController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_manager_to_select, only: [:new, :edit]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new user_params
    @user.company_id = current_user.company.id


    respond_to do |format|
      if @user.save
        format.html { redirect_to tracksu_user_path(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to tracksu_user_path(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to tracksu_users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

  def set_manager_to_select
    @manager = User.with_role(:manager)
    @manager = @manager - [@user]
  end

  def update_user_params
    params.require(:user).permit(:name, :email, :password, :role_ids)
  end

    def user_params
      params.require(:user).permit(:name, :email, :password, :role_ids)
    end
end
