class Answer < ActiveRecord::Base

  validates :user, :poll, :choice, presence: true
  validates_uniqueness_of :user, scope: :poll

  belongs_to :user
  belongs_to :poll
  belongs_to :choice

end
