require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get home" do
    get root_url
    assert_response :success

    assert_select 'title', 'Module Selection'
    assert_select 'h1', 'Module Selection'
    assert_select 'p', 'Welcome to the module selection app!'

    assert_select 'p', "Click on 'Your modules' to view the modules that you have selected."
    assert_select 'p', "Click on 'All modules' to view all available modules."
    assert_select 'p', "If you need any support, send a message in the contact section."
    assert_select 'p', "Please ensure that you select 8 modules in order to meet the 120 credits requirement."
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