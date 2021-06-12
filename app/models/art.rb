class Art < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :name, :artist, :price, :rate, :photo, :style, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_artist,
    against: [ :name, :artist, :style ],
    using: {
      tsearch: { prefix: true } 
  }
  

  STYLES = [ 'abstract', 'fine art', 'modern', 'figurative', 'abstract expressionism', 'expressionism', 'realism', 'conceptual impressionism', 'surrealism', 'portraiture', 'pop art', 'minimalism', 'illustration', 'street art', 'documentary', 'art deco', 'photorealism', 'folk', 'cubism', 'dada' ]
end
