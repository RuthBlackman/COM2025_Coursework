require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success

    assert_select 'title', 'Module Selection'
    assert_select 'h1', 'Module Selection'
    assert_select 'p', 'Welcome to the module selection app!'
  end

end
