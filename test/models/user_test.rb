require 'test_helper'

class UserTest < ActiveSupport::TestCase
	
	def setup
		@user = User.new(name: "Example User", email: "user@example.com",
											password: "hogehoge", password: "hogehoge")
	end

	test "right user should be validate" do
		assert @user.valid?
	end

	test "user have wrong name should not be validate" do
		@user.name = ""
		assert_not @user.valid?
		@user.name = "a" * 200
		assert_not @user.valid?
	end

	test "user have wrong email should not be validate" do
		@user.email = ""
		assert_not @user.valid?
		@user.email = "a" * 300
		assert_not @user.valid?

		right_email_list = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
		right_email_list.each do |addr|
			@user.email = addr
			assert @user.valid?, "#{addr.inspect} should be valid"
		end
		
		wrong_email = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
		wrong_email.each do |addr|
			@user.email = addr
			assert_not @user.valid?, "#{addr.inspect} should be valid"
		end

		@user.email = "example@example.com"
		@user.save
		@user2 = @user.dup
		@user2.email = @user2.email.upcase
		assert_not @user2.valid?
	end

	test "password should be right" do
		assert @user.valid?
		@user.password = " " * 6
		assert_not @user.valid?
		@user.password = "foo"
		assert_not @user.valid?
		@user.password_confirmation = " " * 6
		assert_not @user.valid?
	end

end
