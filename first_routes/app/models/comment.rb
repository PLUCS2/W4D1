class Comment < ApplicationRecord

  belongs_to :user,
  foreign_key: :user_id,
  class_name: :User 

  belongs_to :artwork,
  foreign_key: :artwork_id,
  class_name: :Artwork 

  has_many :likes,
  foreign_key: :likeable_id,
  class_name: :Like,
  as: :likeable

end