class Listing < ActiveRecord::Base
	attr_accessor :photos
	belongs_to :user
	belongs_to :country
	has_many :available_dates
	has_many :reservations
	mount_uploaders :photos, PhotoUploader

	def self.search_by_title(query)
	  	where("title like ?", "%#{query}%") 
	end

	def self.search_by_country(query)
	  	where(country_id: query) 
	end

	def self.search_by_both(title, country_id)
		search_by_title(title).search_by_country(country_id)
	end

	def self.search(title, country_id)
		return Listing.all.order('created_at DESC').limit(20) if title.nil? && country_id.nil?
	    if (!title.blank? || country_id != 0)
	      if (!title.blank? && country_id != 0)
	        return Listing.search_by_both(title, country_id).order("created_at DESC")
	      elsif !title.blank?
	        return Listing.search_by_title(title).order("created_at DESC")
	      elsif country_id != 0
	        return Listing.search_by_country(country_id).order("created_at DESC")
	      end
	    end
	end
end
