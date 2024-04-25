class CottagesController < ApplicationController

def show
  @cottages = Cottage.find(params[:id])
end

end
