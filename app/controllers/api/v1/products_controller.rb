class Api::V1::ProductsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @ingredients = @product.ingredients
  end

  def update
    if @product.update(product_params)
      render :show
    else
      render_error
    end
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @product.destroy
    head :no_content
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :location_lat, :location_long, :user_id, :img_url)
  end

  def render_error
    render json: { errors: @product.errors.full_messages },
      status: :unprocessable_entity
  end
end
