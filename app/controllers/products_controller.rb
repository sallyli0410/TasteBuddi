class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  before_action :set_product, only: [:show, :update, :destroy]

  # /api/v1/products?tag=sweet
  def index
    if params[:query].present?
      sql_query = "
        products.name @@ :query \
        OR products.description @@ :query \
        OR ingredients.name @@ :query
      "
      @products = Product.joins(:ingredients).where(sql_query, query: "%#{params[:query]}%").distinct
    else
      @products = Product.all.order(updated_at: :desc)
    end
    # if params[:tag].present?
    #   puts params[:tag]
    #   @products = Product.tagged_with(params[:tag])
    # else
    #   @products = Product.all
    # end
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
    @product = Product.new(product_params)
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
    params.require(:product).permit(:name, :description, :location_lat, :location_long, :user_id, :img_url, :tag_list)
  end

  def render_error
    render json: { errors: @product.errors.full_messages },
      status: :unprocessable_entity
  end
end
