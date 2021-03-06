class ReservationsController < ApplicationController
	def index
		if find_parent
			@list = find_parent.reservations.all
			render layout: false
		else
			@list = User.find(current_user.id).reservations.all
		end
	end

	def create
		input = reservation_params
		convert_dates(input)
		@reservation = Reservation.new(input)
		@reservation.user_id = current_user.id if current_user
		if @reservation.save
			# change availability column to false for AvailableDate
			reserve_availability(input[:start_date], input[:end_date], input[:listing_id])
			redirect_to Listing.find(input[:listing_id])
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
      return User.find(params[:user_id]) if !params[:user_id].nil?
    end

  	def reservation_params
  		params.require(:reservation).permit(:start_date, :end_date, :num_guests, :listing_id)
  	end

  	def convert_dates(input)
		input[:start_date] = Date.strptime(input[:start_date], '%m-%d-%Y')
		input[:end_date] = Date.strptime(input[:end_date], '%m-%d-%Y')
  	end

  	def reserve_availability(start_date, end_date, listing_id)
	  date_range = (start_date .. end_date)
	  date_range.each do |date|
	     # something interesting by date
	     AvailableDate.find_by(listing_id: listing_id, date: date).update(availability: false)
	  end
	end
end
