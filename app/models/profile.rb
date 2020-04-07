class Profile < ApplicationRecord
  belongs_to :user
  has_one :trait
  belongs_to :open_house
end
