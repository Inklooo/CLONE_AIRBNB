class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
  end

  def dashboard
    if current_user == nil
      redirect_to new_user_session_path
    else
      @user_bookings = current_user.bookings
      @cottages = Cottage.all
      @user_cottages = current_user.cottages
      @bookings = Booking.where(cottage_id: @user_cottages.ids)
    end
  end
end
