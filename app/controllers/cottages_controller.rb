class CottagesController < ApplicationController

def show
  @cottage = Cottage.find(params[:id])
end

end
