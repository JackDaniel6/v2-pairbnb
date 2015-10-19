class Listing < ActiveRecord::Base
	belongs_to :user
	belongs_to :country
	has_many :available_dates
	has_many :reservations
end
