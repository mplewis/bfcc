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
end
