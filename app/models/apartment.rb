class Apartment < ApplicationRecord
  belongs_to :listing
  has_one :city
  has_one :amenity
end
