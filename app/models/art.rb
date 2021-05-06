class Art < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
# type, :medium, :style, :year, :size, :ready_to_hang, :frame, :materials, :shipping,
  validates :name, :artist, :Price, presence: true
end
