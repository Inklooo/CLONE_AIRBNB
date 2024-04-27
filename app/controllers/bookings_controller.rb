class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :destroy]

  def index
    @users =User.all
  end

  def show
  end

  def new
    @cottage = Cottage.find(params[:cottage_id])
    @booking = Booking.new
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
end
