class Art < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings

  validates :artist, :name, :photos, :price, :type, :year, presence: true
end
