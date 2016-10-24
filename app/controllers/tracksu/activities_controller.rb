class Tracksu::ActivitiesController < Tracksu::TracksuController



  def index
    @activities = Activity.all
  end

  def show

  end


  def new
    @activity = Activity.new
    @activity.build_place
  end

  def edit

  end

  def create
    @activity = Activity.new activity_params
    respond_to do |format|
      if @activity.save
        format.html { redirect_to tracksu_activities_path, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activiy}
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

  end

  def destroy
    @activiy.destroy
    respond_to do |format|
      format.html { redirect_to tracksu_activities_path, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def activity_params
    params.require(:activity).permit( :start_time, place_attributes: [:id, :type], purpose_ids: [], saleproducts_attributes: [:product_id, :rate, :quantity, :_destroy])
  end
end
