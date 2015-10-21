module ListingsHelper

	def display_images(listing)
		image_tag(listing.photos[0].url(:thumb), alt: "Missing image")
	end
end
