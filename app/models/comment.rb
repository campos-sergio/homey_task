class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates :message, presence: true
  after_commit :notify_project

  def author
    user.email_address
  end

  private
    def notify_project
      broadcast_append_to self.project,
        "comments",
        target: "comments",
        partial: "comments/comment",
        locals: { comment: self }
    end
end
