module ReservationsHelper

	# check if user has made a reservation before
	def reservation_exists?(listing_id)
		current_user.reservations.find_by(listing_id: listing_id).nil?
	end

end
