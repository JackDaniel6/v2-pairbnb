class ListingsController < ApplicationController
  def show
  end

  def new
  	@listing = Listing.new
  	@countries = Country.all
  end

  def create
  	@listing = Listing.new(params[listing_params])
  end

  private
  	def listing_params
  		params.require(:listing).permit(:title, :description, :max_guests, :country_id)
  	end
end
