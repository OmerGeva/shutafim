class Apartment < ApplicationRecord
  has_one_attached :photo
  has_one :listing
  belongs_to :city
  belongs_to :amenity
end
