class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates :message, presence: true

  def author
    user.email_address
  end
end
