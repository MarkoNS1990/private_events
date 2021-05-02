class Event < ApplicationRecord
  belongs_to :user
  has_many :attendees

  validates :description, presence: true
  validates :location, presence: true
  validates :title, presence: true
  validates :date, presence: true

  scope :upcoming_events, ->(time = Time.now.midnight) { where('date > ?', time) }
  scope :past_events, ->(time = Time.now.midnight) { where('date < ?', time) }
end
