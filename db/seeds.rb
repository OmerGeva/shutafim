require 'faker'
require 'open-uri'

puts 'Destroying past seeds...'
Listing.destroy_all
Apartment.destroy_all
City.destroy_all
Amenity.destroy_all
Trait.destroy_all
Profile.destroy_all
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

  # Traits
  puts 'creating traits...'
  trait1 = Trait.create(
    smokes: false,
    has_cat: false,
    has_dog: true,
    veg: false)
  trait2 = Trait.create(
    smokes: false,
    has_cat: true,
    has_dog: false,
    veg: true)
  trait3 = Trait.create(
    smokes: true,
    has_cat: false,
    has_dog: false,
    veg: false)

  # Profiles
  puts 'creating profiles...'
  omer_profile = Profile.create(
    user: omer,
    profession: 'Full Stack Developer',
    gender: 'male',
    about_me: "I am a 22 year old living in Tel Aviv. I enjoy sports and going out on the weekends.",
    trait: trait1
    )

  omer_photo = URI.open('https://images.unsplash.com/photo-1519058082700-08a0b56da9b4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2734&q=80')
  omer_profile.photo.attach(io: omer_photo, filename: 'apartment1.jpg', content_type: 'image/jpg')
  brad_profile = Profile.create(
    user: brad,
    profession: 'Full Stack Developer',
    gender: 'male',
    about_me: "I am a 28 year old living in Tel Aviv. I enjoy eating good food and hanging out.",
    trait: trait3
    )

  brad_photo = URI.open('https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80')
  brad_profile.photo.attach(io: brad_photo, filename: 'apartment1.jpg', content_type: 'image/jpg')
  alisa_profile = Profile.create(
    user: alisa,
    profession: 'Full Stack Developer',
    gender: 'female',
    about_me: "I am a 27 year old living in Tel Aviv. I enjoy designing and hanging out with friends.",
    trait: trait2
    )

  alisa_photo = URI.open('https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80')
  alisa_profile.photo.attach(io: alisa_photo, filename: 'apartment1.jpg', content_type: 'image/jpg')
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
