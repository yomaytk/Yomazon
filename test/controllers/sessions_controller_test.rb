require 'test_helper'
include SessionsHelper

class SessionsControllerTest < ActionDispatch::IntegrationTest
	
	def setup
		@user = User.find_by(name: "tanaka")
	end

	test "should get new" do
		get login_path
		assert_template 'sessions/new'
  end

	test "login success" do
		get login_path
		post login_path, params: { session: { email: "tanaka@ex.com", password: "password" } }
		assert_redirected_to root_path
		follow_redirect!
		assert_template 'static_pages/home'
		assert is_logged_in?
		assert_select "a[href=?]", login_path, count: 0
		assert_select "a[href=?]", logout_path, count: 1
	end

	test "logout" do
		get login_path
		post login_path, params: { session: { email: "tanaka@ex.com", password: "password" } }
		assert is_logged_in?
		delete logout_path
		assert_redirected_to root_path
		follow_redirect!
		assert_template 'static_pages/home'
		assert_not is_logged_in?
		assert_select "a[href=?]", login_path, count: 1
		assert_select "a[href=?]", logout_path, count: 0
	end

end
