class CottagesController < ApplicationController

  def new
    @cottage = Cottage.new
  end
  
  def show
    @cottages = Cottage.find(params[:id])
  end

  def create
    @cottage = Cottage.new(cottage_params)
    if @cottage.save
      redirect_to cottages_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def cottage_params
    params.require(:cottage).permit(:name, :address, :description, :price, :availability, :user_id)
  end
end
