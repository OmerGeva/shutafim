class City < ApplicationRecord
  has_many :apartments

  has_many :neighborhood
end
