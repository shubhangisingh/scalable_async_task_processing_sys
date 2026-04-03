class Job < ApplicationRecord
  validates :task, presence: true
  
  after_initialize do
    self.status ||= "pending"
  end
end