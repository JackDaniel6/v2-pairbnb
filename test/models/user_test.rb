require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new(name: "Hecate Morai", email: "hecatemorai@gmail.com")
  end

  test "user should be valid" do
  	assert @user.valid?
  end

  test "user must have name" do
  	@user.name = "     "
  	assert_not @user.valid?
  end

  test "user must have email" do
  	@user.email = "          "
  	assert_not @user.valid?
  end

  test "user name must be within 50 characters" do
  	@user.name = "b" * 51
  	assert_not @user.valid?
  end

  test "user email must be within 255 characters" do
  	@user.email = "b" * 254 + "@gmail.com"
  	assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "user email should be unique" do 
	duplicate_user = @user.dup
	duplicate_user.email = @user.email.upcase
	@user.save
	assert_not duplicate_user.valid?
  end
end
