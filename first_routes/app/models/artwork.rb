class Artwork < ApplicationRecord 
  
  belongs_to :artist,
  foreign_key: :artist_id,
  class_name: :User 

  has_many :shares, 
  foreign_key: :artwork_id, 
  class_name: :ArtworkShare 

  has_many :shared_viewers, 
  through: :shares, 
  source: :viewer

  has_many :comments,
  foreign_key: :artwork_id,
  class_name: :Comment,
  dependent: :destroy

  has_many :commenters,
  through: :comments,
  source: :user,
  dependent: :destroy

  has_many :likes,
  foreign_key: :likeable_id,
  class_name: :Like,
  as: :likeable

end