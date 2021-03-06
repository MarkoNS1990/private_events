class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates_presence_of :event_id, :user_id
end
