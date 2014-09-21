class Status < ActiveRecord::Base
  belongs_to :user
  validates :status, presence: true
end
