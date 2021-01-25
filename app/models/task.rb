class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :status, presence: true
  validates :deadline, presence: true
  validates :priority, presence: true
  scope :search_status, -> (status){where('status = ?',status)}
  scope :search_title, -> (title){where('title LIKE ?',"%#{title}%")}
  belongs_to :user, optional: true
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings

end
