# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Beer.delete_all
Ballot.delete_all

b1 = Beer.create!(name: 'Goose Island IPA')
b2 = Beer.create!(name: 'Dogfish Head 90 Min IPA')
b3 = Beer.create!(name: 'Mother Earth Oatmeal Stout')
b4 = Beer.create!(name: 'Raleigh Brewing Mocha Stout')

li1 = LineItem.create!(beer: b1, weight: 1)
li2 = LineItem.create!(beer: b2, weight: 2)
li3 = LineItem.create!(beer: b3, weight: 3)
li4 = LineItem.create!(beer: b4, weight: 4)

Ballot.create!(line_items: [li1, li2, li3, li4], user_id: 1)
