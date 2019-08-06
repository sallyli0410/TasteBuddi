class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def show
    @user = User.find(params[:id])
    @bookings = @user.bookings
    @requests = Booking.joins(:product).where('products.user_id = ?', params[:id])
  end

  def create
    p 'creating a user...'
    @user = User.create(user_params)
    if @user.save
      p 'saved'
      render :show, status: :created
    else
      p 'cannot save'
      render_error
    end
  end

private

  def user_params
    params.require(:user).permit(:wx_id, :wx_name, :wx_avatar, :phone_number, :seller_complete)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end
end
