require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get home" do
    get root_url
    assert_response :success

    assert_select 'title', 'Module Selection'
    assert_select 'h1', 'Module Selection'
    assert_select 'p', 'Welcome to the module selection app!'
  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_template layout: 'application'
    assert_select 'title', 'Module Selection'
    assert_select 'h1', 'Contact Us'
    assert_select 'p', 'Complete the following form to get in touch with us.'
  end

  test "should post request contact but no email" do
    post request_contact_url
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "should post request contact" do
    post request_contact_url, params:
      {name: "Matthew", email: "matthew@me.com", message: "Hello"}
    assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
  end

end