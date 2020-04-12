class Amenity < ApplicationRecord
  has_many :apartments

  AMENITIES = %w(Wifi dishwasher laundry_washer laundry_dryer cats_ok dogs_ok air_conditioner)
end
