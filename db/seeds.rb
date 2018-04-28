# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



ram = User.create(first_name: 'Ram', last_name: 'Patidar', email: 'ram@yopmail.com', password: '12345678')
ragh = User.create(first_name: 'Ragh', last_name: 'Parashar', email: 'Ragh@yopmail.com', password: '12345678')
vijay = User.create(first_name: 'Vijay', last_name: 'Chouhan', email: 'Vijay@yopmail.com', password: '12345678')


link1 = ram.links.create(url: 'http://google.com')
link2 = ram.links.create(url: 'http://yahoo.com')
link3 = ragh.links.create(url: 'http://yopmail.com')

[ram, ragh, vijay].each do |user|
  user.votes.create(link: link1)
end

[link2, link3].each do |link|
  link.votes.create(user: vijay)
end
