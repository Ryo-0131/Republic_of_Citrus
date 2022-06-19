# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'csv'

# CSV.foreach('db/items.csv', encoding: 'Shift_JIS:UTF-8')do |row|
#   Item.create(item_name: row[0], description: row[1], image_url: row[2], star: row[3])
# end

require 'csv'

csv = CSV.read('db/fixtures/items.csv', encoding: 'UTF-16')
csv.each do |row|
  item_id = row[0]
  item_name = row[1]
  description = row[2]
  image_url = row[3]
  star = row[4]

  Item.seed(:item_id) do |s|
    s.item_id = item_id
    s.item_name = item_name
    s.description = description
    s.image_url = image_url
    s.star = star
  end
end