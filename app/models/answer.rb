class Answer < ActiveRecord::Base

  validates :user, :poll, :choice, presence: true

end
