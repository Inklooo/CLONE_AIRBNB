class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :destroy, :edit_accept, :edit_refuse, :edit, :update]

  def index
    @bookings = current_user.bookings
  end

  def show
    # @cottage = Cottage.find(params[:id])
    # @bookings = @cottage.booking
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
    @booking = Booking.new(booking_params.except(:date_range))

    if booking_params[:date_range].present?
      start_date, end_date = booking_params[:date_range].split(" to ")
      @booking.start_date = start_date
      @booking.end_date = end_date
    end

    @booking.cottage = @cottage
    @booking.user = @user

    if @booking.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update

    if booking_params[:date_range].present?
      start_date, end_date = booking_params[:date_range].split(" to ")
      @booking.start_date = start_date
      @booking.end_date = end_date
      if @booking.save
        redirect_to dashboard_path
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def edit_accept
    @booking.status= "accepted"
    @booking.save
    redirect_to dashboard_path
  end

  def edit_refuse
    @booking.status= "refused"
    @booking.save
    redirect_to dashboard_path
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date_range)
  end

  def cottage_params
    params.require(:cottage).permit(:name, :address, :description, :price, :availability, photos: [])
  end
end
