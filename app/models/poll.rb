class Poll < ActiveRecord::Base

  validates :user, presence: true
  belongs_to :user
  has_many :choices
  has_many :answers

end
