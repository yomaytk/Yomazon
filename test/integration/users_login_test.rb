require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
	
	test "login fail" do
		get login_path
		post login_path, params: { session: { email: "foofoo@example.com", password: "foofoo" } }
		assert_template 'sessions/new'
		assert_not flash.empty?
		get root_path
		assert flash.empty?
	end
end
