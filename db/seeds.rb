require 'faker'

# Users
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
apt1_amenity = Amenity.create(
  laundry_washer: true,
  air_conditioner: true
)

# Cities
tel_aviv = City.create(
  name: 'Tel Aviv'
)

# Apartments
apartment1 = Apartment.create(
  bedrooms: 3,
  bathrooms: 2,
  total_rooms: 6,
  description: Faker::Lorem.sentence(word_count: 8),
  street_address: Faker::Address.street_address,
  city_id: tel_aviv,
  amenity_id: apt1_amenity,
  photo: 'https://source.unsplash.com/1600x900/?apartment,room'
)

# Listings
listing1 = Listing.create(
  user: brad,
  price: rand(1000..3000),
  duration: 1,
  apartment_id: apartment1
)
