class Amenity < ApplicationRecord
  has_many :apartments

  AMENITIES = %w(Cat Smokes Dog Vegeterian)
end
