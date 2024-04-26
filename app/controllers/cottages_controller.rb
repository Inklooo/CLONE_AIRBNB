class CottagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @cottages = Cottage.all
  end

  def new
    @cottage = Cottage.new
  end

  def show
    @cottage = Cottage.find(params[:id])
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

  private


  def cottage_params
    params.require(:cottage).permit(:name, :address, :description, :price, :availability)
  end
end
