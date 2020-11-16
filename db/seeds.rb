# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
User.destroy_all
Article.destroy_all
Vote.destroy_all

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

# 3.times do |index|
#   article = Article.create!(author: User.find_by(username: 'Lola'), 
#                 title: 'Faker::Lorem.sentence(word_count: 3)',
#                 text: Faker::Lorem.paragraphs(number: 5),
#                 category: Category.find_by(priority: 1)
#   )
#   article.image.attach(io: File.open('/app/assets/images/'), filename: 'tapatia.jpg')
#   article.save
# end

Article.create! ([{
  title: 'Effort, Persistance, & Strength: My Tale as a Ballerina Mexicana.',
  text: lorem_filler,
  author: User.first,
  category: Category.find_by(name: 'Art & Culture')
},
{
  title: 'Programming: The Best Career Option For Digital Nomads?',
  text: lorem_filler,
  author: User.first,
  category: Category.find_by(name: 'Programming')
},
{
  title: 'Why Young Girls Should Learn How To Code',
  text: lorem_filler,
  author: User.find(2),
  category: Category.find_by(name: 'Programming')
},
{
  title: 'Top 5 Online Communities for Latina Programmers.',
  text: lorem_filler,
  author: User.find(3),
  category: Category.find_by(name: 'Programming')
}])

Vote.create! {
  user: User.find(3)
  article: Article.find_by title: 'Effort, Persistance, & Strength: My Tale as a Ballerina Mexicana.',
}

p "Created #{Category.count} categories."
p "Created #{User.count} users."
p "Created #{Article.count} articles."
p "Created #{Vote.count} votes."
