require 'faker'
require 'open-uri'

puts 'Destroying past seeds...'
Listing.destroy_all
Apartment.destroy_all
City.destroy_all
Amenity.destroy_all
User.destroy_all

# Users
puts 'Creating users...'
omer = User.create(
  email: 'omer@geva.com',
  password: '123456',
  first_name: 'Omer',
  last_name: 'Geva',
  phone_number: rand(10 ** 10),
  dob: Faker::Date.birthday(min_age: 18, max_age: 65),
)

brad = User.create(
  email: 'brad@korman.com',
  password: '123456',
  first_name: 'Brad',
  last_name: 'Korman',
  phone_number: rand(10 ** 10),
  dob: Faker::Date.birthday(min_age: 18, max_age: 65),
)

alisa = User.create(
  email: 'alisa@silina.com',
  password: '123456',
  first_name: 'Alisa',
  last_name: 'Silina',
  phone_number: rand(10 ** 10),
  dob: Faker::Date.birthday(min_age: 18, max_age: 65),
)

# Amenities
puts 'Creating amenities...'
apt1_amenity = Amenity.create(
  laundry_washer: true,
  air_conditioner: true
)

apt2_amenity = Amenity.create(
  laundry_washer: true,
  air_conditioner: true,
  wifi: true,
  cats_ok: true
)

# Cities
puts 'Creating cities...'
tel_aviv = City.create(
  name: 'Tel Aviv'
)

# Apartments
puts 'Creating apartments...'
apartment1 = Apartment.create(
  name: 'Large apartment in the city center',
  bedrooms: 3,
  bathrooms: 2,
  total_rooms: 6,
  description: Faker::Lorem.sentence(word_count: 10),
  street_address: Faker::Address.street_address,
  city: tel_aviv,
  amenity: apt1_amenity
)
apt1_photo = URI.open('https://source.unsplash.com/1600x900/?apartment,room,flat')
apartment1.photo.attach(io: apt1_photo, filename: 'apartment1.jpg', content_type: 'image/jpg')

apartment2 = Apartment.create(
  name: 'Artistic studio',
  bedrooms: 1,
  bathrooms: 1,
  total_rooms: 2,
  description: Faker::Lorem.sentence(word_count: 16),
  street_address: Faker::Address.street_address,
  city: tel_aviv,
  amenity: apt2_amenity
)
apt2_photo = URI.open('https://source.unsplash.com/1600x900/?apartment,room,flat')
apartment2.photo.attach(io: apt2_photo, filename: 'apartment2.jpg', content_type: 'image/jpg')

apartment3 = Apartment.create(
  name: 'Perfect apartment for the couple',
  bedrooms: 2,
  bathrooms: 1,
  total_rooms: 3,
  description: Faker::Lorem.sentence(word_count: 12),
  street_address: Faker::Address.street_address,
  city: tel_aviv,
  amenity: apt2_amenity
)
apt3_photo = URI.open('https://source.unsplash.com/1600x900/?apartment,room,flat')
apartment3.photo.attach(io: apt3_photo, filename: 'apartment3.jpg', content_type: 'image/jpg')

# Listings
puts 'Creating listings...'
listing1 = Listing.create(
  user: brad,
  price: rand(1000..3000),
  duration: 1,
  apartment: apartment1
)

listing2 = Listing.create(
  user: omer,
  price: rand(1000..3000),
  duration: 1,
  apartment: apartment2
)

listing3 = Listing.create(
  user: alisa,
  price: rand(1000..3000),
  duration: 1,
  apartment: apartment3
)
