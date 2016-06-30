class Answer < ActiveRecord::Base

  validates :user, :poll, :choice, presence: true

  belongs_to :user
  belongs_to :poll
  belongs_to :choice

end
