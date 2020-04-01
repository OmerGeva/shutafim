class OpenHouseAppt < ApplicationRecord
  belongs_to :user
  belongs_to :open_house
end
