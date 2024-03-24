# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

categories = [
  '食料品', '調味料', 'お酒',  '備蓄食料', '日用品', 'ギフト', 'お菓子', 'デザート', '化粧品', 'お子様', 'ペット', 'その他'
]

Category.destroy_all
categories.each do |name|
  Category.create(name: name)
end