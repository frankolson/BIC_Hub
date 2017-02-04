# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class SeedHelpers
  def self.create_comment(resource, id)
    commentable = resource
    comment = commentable.comments.create({
      comment: Faker::Lorem.paragraph(3),
      user: User.find(id+1)
    })
  end
end

# create Users
5.times do
  User.new({
    first_name:             Faker::Name.first_name,
    last_name:              Faker::Name.last_name,
    bio:                    Faker::Lorem.paragraph(3),
    email:                  Faker::Internet.email,
    password:               'password',
    password_confirmation:  'password',
    confirmed_at:           Time.now
  }).save!
end

# create Posts/Event/Comment/Link
5.times do |i|
  post = Post.new({
    content: Faker::Lorem.paragraph(2),
    user: User.find(i+1)
  })
  post.save!
  SeedHelpers.create_comment(Post.last, i)

  event = Event.new({
    name: Faker::Lorem.sentence(5),
    time: Faker::Date.forward(80),
    user: User.find(i+1)
  })
  event.save!
  SeedHelpers.create_comment(Event.last, i)
end
