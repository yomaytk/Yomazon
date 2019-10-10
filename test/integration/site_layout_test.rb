require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	
	test "site layout test" do
		get root_path
		assert_select "a[href=?]", root_path, count: 1
		assert_select "a[href=?]", contact_path, count: 1
	end

end
