require 'csv'

csv = CSV.read('db/items.csv')
csv.each do |category|
Category.seed do |s|
s.id = category[0]
s.name = category[1]
end
end



require 'csv'

CSV.foreach('db/items.csv', encoding: 'Shift_JIS:UTF-8')do |row|
  Item.create(item_name: row[0], description: row[1], image_url: row[2], star: row[3])
end
