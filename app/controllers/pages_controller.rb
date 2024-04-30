class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
  end

  def dashboard
    @user_bookings = current_user.bookings
    @user_cottages = current_user.cottages
    @cottages = current_user.cottages.includes(:bookings)
  end

end
