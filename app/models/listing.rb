class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :apartment
  accepts_nested_attributes_for :apartment
end
