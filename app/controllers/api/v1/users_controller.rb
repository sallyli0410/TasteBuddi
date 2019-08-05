class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token

  def show
    @users = User.find(parmas[:id])
    @product = @user.products
    @bookings = @user.bookings
    @reviews = @users.reviews
  end

  def create
    @user = Users.create(users_params)
    if @user.save
      render :show, :created
    else
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
