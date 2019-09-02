# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
Comment.destroy_all 
Like.destroy_all

user1 = User.create!(username: 'Jesse')
user2 = User.create!(username: 'Paloma')
user3 = User.create!(username: 'Lucy')


artwork1 = Artwork.create!(title: 'Starry Night', image_url: 'j.com', artist_id: user1.id)
artwork2 = Artwork.create!(title: 'The Kiss', image_url: 'p.com', artist_id: user2.id)
artwork3 = Artwork.create!(title: 'Paris in the Rain', image_url: 'l.com', artist_id: user1.id)

artwork_share1 = ArtworkShare.create!(artwork_id: artwork3.id, viewer_id: user3.id)
artwork_share2 = ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user1.id)
artwork_share3 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user2.id)

comment1 = Comment.create!(body: 'Great job!', user_id: user3.id, artwork_id: artwork1.id)
comment2 = Comment.create!(body: 'So pretty....', user_id: user1.id, artwork_id: artwork2.id)
comment3 = Comment.create!(body: 'Let me tell you about the Romantic period...', user_id: user3.id, artwork_id: artwork2.id)


like1 = Like.create!(likeable_type: "Comment", likeable_id: comment1.id, liker_id: user1.id)
like2 = Like.create!(likeable_type: "Artwork", likeable_id: artwork1.id, liker_id: user2.id)
like3 = Like.create!(likeable_type: "Comment", likeable_id: comment1.id, liker_id: user3.id)