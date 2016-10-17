class Tracksu::UsersController < Tracksu::TracksuController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /tracksu/users
  # GET /tracksu/users.json
  def index
    @users = User.all
  end

  # GET /tracksu/users/1
  # GET /tracksu/users/1.json
  def show
  end

  # GET /tracksu/users/new
  def new
    @user = User.new
  end

  # GET /tracksu/users/1/edit
  def edit
  end

  # POST /tracksu/users
  # POST /tracksu/users.json
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

  # PATCH/PUT /tracksu/users/1
  # PATCH/PUT /tracksu/users/1.json
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

  # DELETE /tracksu/users/1
  # DELETE /tracksu/users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to tracksu_users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
