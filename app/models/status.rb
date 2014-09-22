class Status < ActiveRecord::Base
  belongs_to :user
  validates :status, presence: true
  self.per_page = 2
end
