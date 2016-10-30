class Tracksu::PlacesController < Tracksu::TracksuController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.all
  end

  def show
  end


  def new
    @place = Place.new
  end


  def edit
  end

  def create
    # @place = Place.new(place_params)
    @place = current_user.company.places.new place_params
    respond_to do |format|
      if @place.save
        format.html { redirect_to tracksu_places_path, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to tracksu_places_path, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to tracksu_places_path, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :address)
    end
end
