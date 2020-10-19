# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Category.destroy_all
User.destroy_all
Article.destroy_all

Category.create! ([{
  name: 'Programming',
  priority: 1
},
{
  name: 'Science',
  priority: 2
},
{
  name: 'Motherhood',
  priority: 3
},
{
  name: 'Art & Culture',
  priority: 4
},
{
  name: 'Health',
  priority: 5
}])

User.create! ([{
  name: 'Lola Chapman',
  username: 'Lola',
  email: 'lola@foo.com',
  password: '123456',
  password_confirmation: '123456'
},
{
  name: 'Tony Copacabana',
  username: 'Tony',
  email: 'tony@foo.com',
  password: '123456',
  password_confirmation: '123456' 
},
{
  name: 'Barry Manilow',
  username: 'Barry',
  email: 'barry@foo.com',
  password: '123456',
  password_confirmation: '123456'
}])

3.times do |index|
  article = Article.create!(author: User.find_by(username: 'Lola'), 
                title: Faker::Lorem.sentence(word_count: 3),
                text: Faker::Lorem.paragraphs(number: 5),
                category: Category.find_by(priority: 1)
  )
  article.image.attach(io: File.open('/app/assets/images/'), filename: 'file.pdf')
  article.save
end

3.times do |index|
  Article.create!(author: User.find_by(username: 'Tony'),
                title: Faker::Lorem.sentence(word_count: 3),
                text: Faker::Lorem.paragraphs(number: 6),
                category: Category.find_by(priority: 2)
  )
end

3.times do |index|
  Article.create!(author: User.find_by(username: 'Barry'),
                title: Faker::Lorem.sentence(word_count: 3),
                text: Faker::Lorem.paragraphs(number: 6),
                category: Category.find_by(priority: 3)
)
end

3.times do |index|
  Article.create!(author: User.find_by(username: 'Lola'),
                title: Faker::Lorem.sentence(word_count: 3),
                text: Faker::Lorem.paragraphs(number: 6),
                category: Category.find_by(priority: 4)
)
end

3.times do |index|
  Article.create!(author: User.find_by(username: 'Tony'),
                title: Faker::Lorem.sentence(word_count: 3),
                text: Faker::Lorem.paragraphs(number: 6),
                category: Category.find_by(priority: 5)
)
end


p "Created #{Category.count} categories."
p "Created #{User.count} users."
p "Created #{Article.count} articles."
