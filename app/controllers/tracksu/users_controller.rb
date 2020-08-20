class Tracksu::UsersController < Tracksu::TracksuController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
  end

  def show
    if search_param['search_date'].present?
      @activities = @user.activities.where('activity_date = ?', Date.strptime(search_param['search_date'], "%d/%m/%Y"))
      @date = params['search_date']
    else
      @activities = @user.activities.where('activity_date = ?', Date.today)
      @date = Date.today
    end


  end

  def new
    @user = User.new
  end

  def edit

  end

  def create
    @user = User.new user_params
    @user.company_id  = current_user.company.id
    @user.company_id  = user_params[:company_id] unless user_params[:company_id].blank?
    puts user_params[:company_id].inspect
    puts user_params.inspect


    respond_to do |format|
      if @user.save
        format.html { redirect_to tracksu_users_path, notice: 'User was successfully created.' }
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
        format.html { redirect_to tracksu_users_path, notice: 'User was successfully updated.' }
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
  def change_password
    @user = current_user
  end
  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(use_params)
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def search_param
      params.permit(:search_date)
    end

    def use_params
      params.require(:user).permit(:current_password, :password, :password_confirmation)
    end

    def update_user_params
      params.require(:user).permit(:name, :email, :password, :role_ids)
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :role_ids, :company_id)
    end
end
