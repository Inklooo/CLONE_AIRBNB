class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :destroy]

  def index
    @users =User.all
  end

  def show
    # @cottage = Cottage.find(params[:id])
    # @bookings = @@cottage.booking
    # @bookings_dates = @bookings.map do |booking|
    #   {
    #     from: booking.start_date,
    #     to:   booking.end_date
    #   }
    # end
  end

  def new
    @cottage = Cottage.find(params[:cottage_id])

    if @cottage.user != current_user
      @booking = Booking.new
    else
      flash[:alert] = "You can't book your own cottage"
      redirect_to '/500.html'
    end
  end

  def create
    @cottage = Cottage.find(params[:cottage_id])
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.cottage = @cottage
    @booking.user = @user

    if @booking.save
      redirect_to bookings_path
    else
      flash[:alert] = "Data error !"
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def cottage_params
    params.require(:cottage).permit(:name, :address, :description, :price, :availability, photos: [])
  end
end
