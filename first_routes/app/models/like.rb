class Like < ApplicationRecord
  #likeable_id, likeable_type, liker_id

  belongs_to :liker,
  foreign_key: :liker_id,
  class_name: :User 

  belongs_to :likeable, 
  foreign_key: :likeable_id,
  class_name: :likeable_type,
  polymorphic: true

end