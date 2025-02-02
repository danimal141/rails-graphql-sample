# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Post.count == 0
  20.times.each do |i|
    Post.create!(title: Faker::Lorem.words.join(' '), description: Faker::Lorem.sentence)
  end
end

if Comment.count == 0
  50.times.each do |i|
    Comment.create!(content: Faker::Lorem.sentence, post: Post.all.sample)
  end
end
