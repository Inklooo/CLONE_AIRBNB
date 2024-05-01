class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
  end

  def dashboard
    @user_bookings = current_user.bookings
    @cottages = Cottage.all
    @user_cottages = current_user.cottages
    @bookings = Booking.where(cottage_id: @user_cottages.ids)
  end

end
