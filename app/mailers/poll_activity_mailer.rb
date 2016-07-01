class PollActivityMailer < ApplicationMailer
  def new_response(poll)
    @poll = poll
    @user = poll.user
    subject = "New response for your poll: \"#{poll.text}\""
    mail to: @user.email, subject: subject
  end
end
