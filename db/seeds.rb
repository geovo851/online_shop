# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

roles = Role.create([
  {title: 'admin'},
  {title: 'user'}
]) if Role.count == 0

categories = []
categories << Category.create(category: "Monitors")
categories << Category.create(category: "Processors")
categories << Category.create(category: "Motherboards")
categories << Category.create(category: "Memory")
categories << Category.create(category: "Keyboards")

categories.each do |category|
  1.upto(40) do |n|
    Good.create(name: "#{category.category} #{n}",
                 description: "Best #{category.category} #{n}!!!",
                 category_id: category.id,
                 price: n * 120.35,
                 available: true)
  end
end
