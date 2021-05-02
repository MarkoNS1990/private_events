class Event < ApplicationRecord
  belongs_to :user
  has_many :attendees

  scope :upcoming_events, ->(time = Time.now.midnight) { where('date > ?', time) }
  scope :past_events, ->(time = Time.now.midnight) { where('date < ?', time) }
end
