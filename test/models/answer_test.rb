require 'faker'

class AnswerTest < ActiveSupport::TestCase
  test 'user should not be able to answer a poll twice' do
    p = build(:poll)
    choices = []
    5.times do
      c = Choice.new poll: p, text: Faker::Lorem.sentence
      c.save!
      choices << c
    end

    u = build(:user)

    a1 = Answer.new user: u, poll: p, choice: choices[0]
    a1.save!

    a2 = Answer.new user: u, poll: p, choice: choices[1]
    assert_raises ActiveRecord::RecordInvalid do
      a2.save!
    end
  end

  test 'user should be emailed when their poll is answered' do
    u = build(:user)
    p = Poll.new user: u, text: Faker::Lorem.sentence
    p.save!
    c = Choice.new poll: p, text: Faker::Lorem.sentence
    c.save!

    a1 = Answer.new user: u, poll: p, choice: c
    a1.save!

    email = ActionMailer::Base.deliveries.last
    assert_not_nil email, 'No email was sent'
    assert email['to'].to_s == u.email, 'Email was not sent to the poll owner'
    assert email['subject'].to_s.include?('New response'), 'Subject did not include "New response"'
    assert email.body.raw_source.include?(p.text), 'Body did not include poll text'
  end
end
