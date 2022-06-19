require 'csv'

csv = CSV.read('db/fixtures/development/category.csv')
csv.each do |category|
Category.seed do |s|
s.id = category[0]
s.name = category[1]
end
en