require 'json'

p "Destroying seed"
Listing.destroy_all
Booking.destroy_all
Reservation.destroy_all

# path = File.join Rails.root, 'db'
filepath = File.join(Rails.root, 'db', 'input.json')
serialized_input = File.read(filepath)
input = JSON.parse(serialized_input)

# Creating Listings
p "Creating Listings"
listings = input['listings']
listings.each do |listing|
  l = Listing.create(num_rooms: listing['num_rooms'])
end

# Creating Bookings
p "Creating bookings"
bookings = input['bookings']
bookings.each do |booking|
  l = Booking.create(start_date: booking['start_date'], end_date: booking['end_date'], listing_id: booking['listing_id'])
end

# Creating Reservations
p "Creating reservations"
reservations = input['reservations']
reservations.each do |reservation|
  l = Reservation.create(start_date: reservation['start_date'], end_date: reservation['end_date'], listing_id: reservation['listing_id'])
end

p "Seed created"
