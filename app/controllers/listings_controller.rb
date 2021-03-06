class ListingsController < ApplicationController
  def index
    #check if nested under user
    if find_parent
      @list = find_parent.listings.all
      render layout: false
    else
      title = params[:title] if !params[:title].nil?
      country_id = params[:country_id][0].to_i if !params[:country_id].nil?
      @list = Listing.search(title, country_id)
      params[:title] = nil
      params[:country_id] = nil
      flash.now[:danger] = "Your search returned no results" if @list == []
    end
  end

  def show
  	@listing = Listing.find(params[:id])
    @dates = @listing.available_dates.where( availability: true ).map {|x| x = x.date.strftime("%m-%d-%Y") }
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
  		redirect_to @listing
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def find_parent
      User.find(params[:user_id]) if !params[:user_id].nil?
    end

  	def listing_params
  		params.require(:listing).permit(:title, :description, :max_guests, :country_id, {photos: []})
  	end

  	def listing_dates
  		params.require(:listing).permit(:available_dates)
  	end
end
