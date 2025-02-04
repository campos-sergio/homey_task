class Project < ApplicationRecord
  STATUSES = [ "Pending", "In progress", "Completed", "Canceled" ].freeze
  has_many :comments, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :status, inclusion: { in: STATUSES, message: "%{value} is not a valid status." }
end
