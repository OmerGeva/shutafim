class Apartment < ApplicationRecord
  belongs_to :listing

  has_one :amenities
end
