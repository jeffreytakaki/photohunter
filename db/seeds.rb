# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Photo.create!(name: "river")
Photo.create!(name: "mountain")
Photo.create!(name: "beach")
Photo.create!(name: "Jordan")
Photo.create!(name: "Bars scenes")
User.create!(username: 'John')
User.create!(username: 'Jeff')
User.first.photos << Photo.all
User.last.photos << Photo.all



