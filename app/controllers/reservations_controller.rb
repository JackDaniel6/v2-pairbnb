class ReservationsController < ApplicationController
	def create
		input = reservation_params
		input[:start_date] = Date.strptime(input[:start_date], '%m-%d-%Y')
		input[:end_date] = Date.strptime(input[:end_date], '%m-%d-%Y')
		byebug
		@reservation = Reservation.new(input)
		@reservation.user_id = current_user.id if current_user
		debugger
		if @reservation.save
			redirect_to Listing.find(input[:listing_id])
		end
	end

  private
  	def reservation_params
  		params.require(:reservation).permit(:start_date, :end_date, :num_guests, :listing_id)
  	end
end
