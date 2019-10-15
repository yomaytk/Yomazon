require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	
	def setup
	end

	test "invalid user signup" do
		get signup_path
		assert_no_difference "User.count" do
			post signup_path params: { user: { name: "", email: "invalid@example.com", 
																					password: "foo", password_confirmation: "bar" } }
		end
		assert_template 'users/new'
	end

	test "valid user signup" do
		get signup_path
		assert_difference "User.count", 1 do
			post signup_path params: { user: { name: "tanaka", email: "tanaka@example.com", 
																					password: "panaka68", password_confirmation: "panaka68" } }
		end
		follow_redirect!
		assert_template 'static_pages/home'
		assert_not	flash.empty?
	end

end
