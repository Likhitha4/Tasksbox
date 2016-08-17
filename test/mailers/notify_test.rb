require 'test_helper'

class NotifyTest < ActionMailer::TestCase
  test "Announcement" do
    mail = Notify.Announcement
    assert_equal "Announcement", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
