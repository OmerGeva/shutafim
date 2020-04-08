class Trait < ApplicationRecord
  has_one :profile

  TRAITS = %w(Cat Smokes Dog Vegeterian)
end
