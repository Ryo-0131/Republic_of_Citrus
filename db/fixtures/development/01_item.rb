require 'csv'

csv = CSV.read('db/items.csv', encoding: 'Shift_JIS:UTF-8')
csv.each do |row|
Item.seed do |s|
s.item_name = row[0]
s.description = row[1]
s.image_url = row[2]
s.star = row[3]
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