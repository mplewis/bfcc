class Poll < ActiveRecord::Base

  validates :user, presence: true
  belongs_to :user
  has_many :choices
  has_many :answers

  def user_has_voted?(user)
    Answer.exists? user_id: user.id, poll: self
  end

end
