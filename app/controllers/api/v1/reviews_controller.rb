class Api::V1::ReviewsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def create
    @review = Review.new(review_params)
    unless @review.save
      render_error
    end
  end

  def update
    @review = Review.find(params[:id])
    unless @review.update(review_params)
      render_error
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    head :no_content
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating, :product_id, :user_id)
  end

  def render_error
    render json: { errors: @review.errors.full_messages },
      status: :unprocessable_entity
  end
end
