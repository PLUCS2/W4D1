class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
  foreign_key: :artist_id,
  class_name: :Artwork 

  has_many :shares, 
  foreign_key: :viewer_id, 
  class_name: :ArtworkShare

  has_many :shared_artworks, 
  through: :shares, 
  source: :artwork

  has_many :comments,
  foreign_key: :user_id,
  class_name: :Comment,
  dependent: :destroy

  has_many :commented_artworks,
  through: :comments,
  source: :artwork,
  dependent: :destroy

  has_many :likes,
  foreign_key: :liker_id,
  class_name: :Like 
  
end