class Tracksu::PurposesController < Tracksu::TracksuController

  before_action :set_purpose, only: [:show, :edit, :update, :destroy]

  def index
    @purposes = Purpose.all
  end

  def show
  end

  def new
    @purpose = Purpose.new
  end

  def edit
  end

  def create
    @purpose = Purpose.new(purpose_params)
    respond_to do |format|
      if @purpose.save
        format.html { redirect_to tracksu_purposes_path, notice: 'Purpose was successfully created.' }
        format.json { render :show, status: :created, location: @purpose }
      else
        format.html { render :new }
        format.json { render json: @purpose.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @purpose.update(purpose_params)
        format.html { redirect_to tracksu_purposes_path, notice: 'Purpose was successfully updated.' }
        format.json { render :show, status: :ok, location: @purpose }
      else
        format.html { render :edit }
        format.json { render json: @purpose.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @purpose.destroy
    respond_to do |format|
      format.html { redirect_to tracksu_purposes_path, notice: 'Purpose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_purpose
      @purpose = Purpose.find(params[:id])
    end

    def purpose_params
      params.require(:purpose).permit(:title, :activated)
    end
end
