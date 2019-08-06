class Api::V1::BookingsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
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

  def tagged
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :location_lat, :location_long, :user_id, :tag_list)
  end

  def render_error
    render json: { errors: @game.errors.full_messages },
      status: :unprocessable_entity
  end
end
