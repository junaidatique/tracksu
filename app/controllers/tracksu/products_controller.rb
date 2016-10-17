class Tracksu::ProductsController < Tracksu::TracksuController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /tracksu/products
  # GET /tracksu/products.json
  def index
    @products = Product.all
  end

  # GET /tracksu/products/1
  # GET /tracksu/products/1.json
  def show
  end

  # GET /tracksu/products/new
  def new
    @product = Product.new(params[:company_id])
  end

  # GET /tracksu/products/1/edit
  def edit
  end

  # POST /tracksu/products
  # POST /tracksu/products.json
  def create
    @product = Product.new product_params
    respond_to do |format|
      if @product.save
        format.html { redirect_to tracksu_product_path(@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracksu/products/1
  # PATCH/PUT /tracksu/products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to tracksu_product_path(@product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracksu/products/1
  # DELETE /tracksu/products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to tracksu_products_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :activated, :company_id)
    end
end
