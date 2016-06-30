require 'faker'

u = User.new email: Faker::Internet.email, password: Faker::Internet.password
u.save!

p = Poll.new text: 'What is your favorite website?', user: u
p.save!
5.times do
  c = Choice.new poll: p, text: Faker::Internet.domain_name
  c.save!
end

p = Poll.new text: 'What is your favorite sports team?', user: u
p.save!
5.times do
  c = Choice.new poll: p, text: Faker::Team.name
  c.save!
end

p = Poll.new text: 'What is your favorite book?', user: u
p.save!
5.times do
  c = Choice.new poll: p, text: "#{Faker::Book.title} by #{Faker::Book.author}"
  c.save!
end

50.times do
  u = User.new email: Faker::Internet.email, password: Faker::Internet.password
  u.save!
  Poll.all.each do |p|
    c = p.choices.sample
    a = Answer.new user: u, poll: p, choice: c
    a.save!
  end
end
