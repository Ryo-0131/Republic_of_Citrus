# require 'csv'

# csv = CSV.read('db/items.csv', encoding: 'UTF-16')
# csv.each do |row|
#   row_id= row[0]
# Item.seed(:item_name, :description, :image_url) do |s|
# s.item_name = row[1]
# s.description = row[2]
# s.image_url = row[3]
# s.star = row[4]
# end
# end

require 'csv'

csv = CSV.read('db/items.csv', encoding: 'UTF-16')
csv.each do |row|
  item_id = row[0]
  item_name = row[1]
  description = row[2]
  image_url = row[3]
  star = row[4]

  Item.seed(:row_id) do |s|
    s.item_id = item_id
    s.item_name = item_name
    s.description = description
    s.image_url = image_url
    s.star = star
  end
end


# csv = CSV.read('db/fixtures/line.csv' , encoding: 'Shift_JIS:UTF-8')
# csv.each do |line|
#   line_id = line[0]
#   name = line[1]

#   Line.seed(:line_id) do |s|
#     s.line_id = line_id
#     s.name = name
#   end
# end

