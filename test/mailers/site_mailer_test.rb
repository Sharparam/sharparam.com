require 'test_helper'

class SiteMailerTest < ActionMailer::TestCase
  test 'contact_email' do
    message = ContactMessage.new({
      name: 'Foo',
      email: 'foo@example.com',
      body: 'Test message'
    })

    email = message.to_mail

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['site@sharparam.com'], email.from
    assert_equal ['sharparam@sharparam.com'], email.to
    assert_equal ['foo@example.com'], email.reply_to
    assert_equal 'New message from Foo', email.subject
  end
end
