# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'

class DatabaseSeeder
	def self.seed_countries
		Country.delete_all
		open("http://openconcept.ca/sites/openconcept.ca/files/country_code_drupal_0.txt") do |countries|
		  countries.read.each_line do |country|
		    code, name = country.chomp.split("|")
		    Country.create!(:name => name)
		  end
		end
	end

	def self.seed_admin_user
		User.create!(
			name: "adminuser",
			email: "mingxiangchan@gmail.com",
			password: "123456",
			password_confirmation: "123456"
			)
	end

	def self.seed_listings
		10.times do |i|
			puts "creating #{i}th listing"
			@listing = Listing.create!(
				country_id: rand(1..240),
				user_id: 1,
				title: Faker::Lorem.sentence(rand(1..8)),
				description: Faker::Lorem.paragraph(rand(1..3)),
				max_guests: rand(1..6)
				)

			date_array =[]
			35.times do 
				date = Faker::Date.forward(50)
				date_array << date
			end
			date_array.uniq.each { |date| @listing.available_dates.create!(date: date, availability: true) }
		end
	end
end

DatabaseSeeder.seed_countries
DatabaseSeeder.seed_admin_user
DatabaseSeeder.seed_listings