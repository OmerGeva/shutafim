class Profile < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :trait

  has_one_attached :photo

  validates :gender, presence: true
  validates :about_me, presence: true
  validates :photo, presence: true
end
