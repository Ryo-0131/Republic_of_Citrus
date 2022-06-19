require 'csv'

csv = CSV.read('db/items.csv', encoding: 'UTF-16')
csv.each do |row|
  row_id= row[0]
Item.seed(:item_name, :description, :image_url) do |s|
s.row_id= row_id
s.item_name = row[1]
s.description = row[2]
s.image_url = row[3]
s.star = row[4]
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