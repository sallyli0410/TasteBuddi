class Api::V1::BookingsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_booking, only: [:show, :update]

 # should be able to show an individual booking
  def show
  end

  # create a new booking for an individual booking
  def create
    @booking = Booking.new(booking_params)
      if @booking.save
        render :show, status: :created
      else
        render_error
      end
  end

  # Seller can update a booking status
  def update
    if @booking.update(booking_params)
      render :show
    else
      render_error
  end

private

  def set_bookings
    @booking = Bookings.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :completed, :time, :user_id, :product_id)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
    status: :unprocessable_entity
  end
end

