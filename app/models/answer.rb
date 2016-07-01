class Answer < ActiveRecord::Base

  validates :user, :poll, :choice, presence: true
  validates_uniqueness_of :user, scope: :poll

  belongs_to :user
  belongs_to :poll
  belongs_to :choice

  after_create do |answer|
    poll = answer.poll
    PollActivityMailer.new_response(poll).deliver_now
  end

end
