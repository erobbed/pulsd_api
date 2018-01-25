namespace :syndicate do
  desc 'Syndicates any new Events in db to Eventbrite API'
  task eventbrite: :environment do
    events = Event.select { |e| e.created_at > Time.now - 3600 }
  end

  desc 'Syndicates and new Events in db to Meetup API'
  task meetup: :environment do
    events = Event.select { |e| e.created_at > Time.now - 3600 }
    puts events
  end
end
