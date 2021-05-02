require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'check validations' do
    it 'return false if the description field is not filled in' do
      e = Event.new(date: '05-06-2022', location: 'Serbia')
      e.save
      expect(e).to_not be_valid
    end

    it 'return false if the location field is not filled in' do
      e = Event.new(description: 'partyy!', date: '05-06-2022')
      e.save
      expect(e).to_not be_valid
    end

    it 'return false if the date is not filled in' do
      e = Event.new(description: 'partyy!!', location: 'Serbia')
      e.save
      expect(e).to_not be_valid
    end

    it 'return true if the description, title, date and location fields are filled in' do
      u = User.create(email: 'test123@test.com', password: 123_456)
      e = Event.create(date: '01/06/2021', description: 'partyy!', location: 'Serbia', title: 'Event 1', user_id: u.id)
      expect(e).to be_valid
    end
  end

  context 'scopes' do
    it 'returns two for past_events' do
      u = User.create(email: 'test123@test.com', password: 123_456)
      Event.create(date: '05/01/2021', description: 'partyy!',
                   location: 'Serbia', title: 'Event 1', user_id: u.id)
      Event.create(date: '12/01/2021', description: 'partyy!', location: 'Serbia', title: 'Event 1', user_id: u.id)
      Event.create(date: '05/05/2021', description: 'partyy!', location: 'Serbia', title: 'Event 1', user_id: u.id)
      Event.create(date: '01/06/2021', description: 'partyy!', location: 'Serbia', title: 'Event 1', user_id: u.id)
      Event.create(date: '03/07/2021', description: 'partyy!', location: 'Serbia', title: 'Event 1', user_id: u.id)
      expect(Event.past_events.count).to eq(2)
    end

    it 'returns three for upcoming_events' do
      u = User.create(email: 'test123@test.com', password: 123_456)
      Event.create(date: '05/01/2021', description: 'partyy!', location: 'Serbia', title: 'Event 1', user_id: u.id)
      Event.create(date: '12/01/2021', description: 'partyy!', location: 'Serbia', title: 'Event 1', user_id: u.id)
      Event.create(date: '05/05/2021', description: 'partyy!', location: 'Serbia', title: 'Event 1', user_id: u.id)
      Event.create(date: '01/06/2021', description: 'partyy!', location: 'Serbia', title: 'Event 1', user_id: u.id)
      Event.create(date: '03/07/2021', description: 'partyy!', location: 'Serbia', title: 'Event 1', user_id: u.id)
      expect(Event.upcoming_events.count).to eq(3)
    end
  end
end
