class ListingsController < ApplicationController
  def show
  	@listing = Listing.find(params[:id])
  end

  def new
  	@listing = Listing.new
  	@countries = Country.all
  end

  def create
  	@listing = Listing.new(listing_params)
  	@listing.user_id = current_user.id if current_user
  	if @listing.save
  		listing_dates["available_dates"].split(",").each{ |date|
  			@listing.available_dates.create!(date: Date.strptime(date, '%m/%d/%Y'), availability: true)
  		}
  		redirect to @listing
  	else
  		render 'new'
  	end
  end

  private
  	def listing_params
  		params.require(:listing).permit(:title, :description, :max_guests, :country_id)
  	end

  	def listing_dates
  		params.require(:listing).permit(:available_dates)
  	end
end
