require 'test_helper'

class ServiceMailerTest < ActionMailer::TestCase
  test "transfer_confirmation" do
    mail = ServiceMailer.transfer_confirmation
    assert_equal "Transfer confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
