# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user1 = User.create!(name: 'Jesse', email: 'j@gmail.com')
user2 = User.create!(name: 'Paloma', email: 'p@gmail.com')
user3 = User.create!(name: 'Lucy', email: 'l@gmail.com')
