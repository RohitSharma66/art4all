class Art < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :name, :artist, :price, :style, presence: true

  STYLES = [ 'abstract', 'fine art', 'modern', 'figurative', 'abstract expressionism', 'expressionism', 'realism', 'conceptual impressionism', 'surrealism', 'portraiture', 'pop art', 'minimalism', 'illustration', 'street art', 'documentary', 'art deco', 'photorealism', 'folk', 'cubism', 'dada' ]
end
