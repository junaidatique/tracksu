class Tracksu::ActivitiesController < Tracksu::TracksuController

  before_action :set_activity, only: [:show, :edit, :update, :destroy]


  def index
    @activities = Activity.all
  end

  def show
    @activities = Activity.all
  end


  def new
    @activity = Activity.new
    @activity.build_place
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def create
    @activity = current_user.activities.new(activity_params)
    respond_to do |format|
      if @activity.save
        format.html { redirect_to tracksu_activities_path, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity}
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to tracksu_activities_path, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to tracksu_activities_path, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:comment, :start_time, place_attributes: [:id, :customer_type], purpose_ids: [], saleproducts_attributes: [:product_id, :rate, :quantity, :_destroy])
  end
end
