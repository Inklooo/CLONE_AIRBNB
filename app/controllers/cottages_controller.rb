class CottagesController < ApplicationController
  def index
    @cottages = Cottage.all
  end
end
