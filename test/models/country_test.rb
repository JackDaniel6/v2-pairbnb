require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@country = Country.new(name: "America")
  	@listing = Listing.new(country_id: 1)
  end
end
