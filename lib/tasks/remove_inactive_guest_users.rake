task remove_inactive_guest_users: :environment do
  User.guests.each do |guest|
    if guest.last_active && guest.last_active < 2.weeks.ago
      guest.destroy
      puts "#{guest} has been inactive for over 2 weeks and has been removed"
    end
  end
end
