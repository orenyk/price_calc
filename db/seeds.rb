# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

type_count = 3
component_count = 15
min_price = 1
max_price = 100
categories = ['Rings', 'Necklaces', 'Bracelets', 'Pendants', 'Earrings']
materials = ['Rose Gold', 'Yellow Gold', 'White Gold', 'Sterling Silver', 'Platinum']
line_count = 2
set_count = 10
product_count = 50
ingredient_count = 150
count_max = 5
price_count = 4
max_multiple = 5
min_multiple = 1.5


# create dummy data
(1..type_count).each { |i| ComponentType.create(name: "Type#{i}") }
(1..component_count).each do |i|
  Component.create(
    name: "Component#{i}",
    component_type_id: rand(type_count)+1,
    cost: (max_price - min_price) * rand() + min_price)
end
(1..categories.length).each { |i| Category.create(name: categories[i]) }
(1..materials.length).each { |i| Material.create(name: materials[i]) }
(1..line_count).each { |i| ProductLine.create(name: "Line#{i}") }
(1..set_count).each do |i|
  ProductSet.create(
    name: "Set#{i}",
    product_line_id: rand(line_count)+1)
end
(1..product_count).each do |i|
  line = ProductLine.all.sample
  set = ProductSet.where(product_line_id: line.id).sample
  Product.create(
    name: "Product#{i}",
    category_id: rand(categories.length)+1,
    material_id: rand(materials.length)+1,
    product_set_id: set.id,
    product_line_id: line.id)
end
(1..ingredient_count).each do |i|
  Ingredient.create(
    product_id: rand(product_count)+1,
    component_id: rand(component_count)+1,
    count: rand(count_max)+1)
end
Price.create(name: 'cost', multiple: 1)
(1..price_count).each do |i|
  Price.create(
    name: "Price#{i+1}",
    multiple: (max_multiple - min_multiple) * rand() + min_multiple)
end

