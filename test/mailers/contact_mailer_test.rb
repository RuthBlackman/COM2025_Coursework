require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "should return contact email" do
    mail = ContactMailer.contact_email("matthew@me.com",
                                       "Matthew Casey", @message = "Hello")
    assert_equal ['rb01143@surrey.ac.uk'], mail.to
    assert_equal ['from@example.com'], mail.from
  end
end
