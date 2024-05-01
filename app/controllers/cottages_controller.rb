class CottagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_cottage, only: [:show, :edit, :update, :destroy]

  def index
    @cottages = Cottage.all
    @markers = @cottages.geocoded.map do |cottage|
      {
        lat: cottage.latitude,
        lng: cottage.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { cottage: cottage })
      }
    end
  end

  def new
    @cottage = Cottage.new
  end

  def show

  end

  def create
    @cottage = Cottage.new(cottage_params)
    @cottage.user = current_user
    if @cottage.save
      redirect_to cottages_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    @userCottage = @cottage.user_id
    @currentUser = current_user.id
    if @userCottage == @currentUser
      if @cottage.update(cottage_params)
        redirect_to cottage_path(@cottage)
      else
      render :edit, status: :unprocessable_entity
      end
    else
      render :show, flash[:alert] = "Error, data can't be find"
    end
  end

  def destroy
    @userCottage = @cottage.user_id
    @currentUser = current_user.id
    if @userCottage == @currentUser
      @cottage.destroy
      redirect_to cottages_path
    else
      render :show, flash[:alert] = "Error, data can't be find"
    end
  end

  private

  def set_cottage
    @cottage = Cottage.find(params[:id])
  end

  def cottage_params
    params.require(:cottage).permit(:name, :address, :description, :price, :availability, photos: [])
  end
end
