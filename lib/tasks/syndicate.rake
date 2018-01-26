namespace :syndicate do
  desc 'Syndicates any new Events in db to Eventbrite API'
  task eventbrite: :environment do
    url = 'https://www.eventbriteapi.com/v3/events/'
    events = Event.select { |e| e.created_at > Time.now - 3600 }
    events.each do |_event|
      body = {
        headers: {
          Authorization: "Bearer #{ENV['eventbrite']}"
        },
        event: {
          name: {
            html: event.name
          },
          description: {
            text: event.description
          },
          start: {
            timezone: 'America/Chicago',
            utc: event.start.iso8601
          },
          end: {
            timezone: 'America/Chicago',
            utc: event.end.iso8601
          },
          currency: 'USD'
        }
      }

      RestClient.post(url, body)
    end
  end

  desc 'Syndicates and new Events in db to Meetup API'
  task meetup: :environment do
    events = Event.select { |e| e.created_at > Time.now - 3600 }
  end
end
