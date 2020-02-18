# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Booking.destroy_all
Pet.destroy_all
User.destroy_all

puts "Creating users..."
user1 = User.new(password: "password", first_name: "Michel", last_name: "Chardou", address: "7 boulevard pasteur, 75015", telephone: "0654756435", description: "J'aime les chatons gris", email: "mich.chardou@gmail.com")
user2 = User.new(password: "password", first_name: "Hélène", last_name: "Elegarsson", address: "10 rue de la liberté, 75011", telephone: "0654456015", description: "Amie des bêtes à poils", email: "h.e@gmail.com")
user3 = User.new(password: "password", first_name: "Bertand", last_name: "Chouin", address: "2 passage du gars, 75002", telephone: "0634567890", description: "Passioné de grenouilles", email: "bertrand.j@gmail.com")
user4 = User.new(password: "password", first_name: "Ludovic", last_name: "Clochet", address: "1 avenue miterrand, 75001", telephone: "0612367891", description: "Cherche perruche à chouchouter", email: "ludo.cloclo@gmail.com")
user5 = User.new(password: "password", first_name: "Pierre", last_name: "Présent", address: "12 rue de ternes, 75010", telephone: "0612345678", description: "Aficionado de caniches egyptiens", email: "pierre.present@gmail.com")


[ user1, user2, user3, user4, user5 ].each do |user|
  user.save
  puts "Created #{user.first_name} #{user.last_name}"
end
puts "Finished!"


puts "Creating pets..."
pet1 = Pet.new(name: "Patatra", description: "Chat blanc doux et calin", species: "cat", price: "600€")
pet1.user = user1
pet2 = Pet.new(name: "Bouloche", description: "Chien ténébreux", species: "dog", price: "200€")
pet2.user = user2
pet3 = Pet.new(name: "Wanchi", description: "Souris verte qui aime courir dans l'herbe", species: "mouse", price: "50€")
pet3.user = user3
pet4 = Pet.new(name: "Coco", description: "Vache qui aime rire", species: "dog", price: "500€")
pet4.user = user4
pet5 = Pet.new(name: "Cookie", description: "Chien très affectueux mais un peu jaloux", species: "dog", price: "150€")
pet5.user = user5


[ pet1, pet2, pet3, pet4, pet5 ].each do |pet|
  pet.save!
  puts "Created #{pet.name}"
end
puts "Finished!"

puts "Creating bookings..."
booking1 = Booking.new(status: true, start_date: 20200101, end_date: 20200105)
booking1.user = user2
booking1.pet = pet1
booking2 = Booking.new(status: false, start_date: 20200107, end_date: 20200115)
booking2.user = user3
booking2.pet = pet2
booking3 = Booking.new(status: false, start_date: 20200203, end_date: 20200217)
booking3.user = user4
booking3.pet = pet3
booking4 = Booking.new(status: true, start_date: 20200201, end_date: 20200219)
booking4.user = user5
booking4.pet = pet4
booking5 = Booking.new(status: false, start_date: 20200110, end_date: 20200112)
booking5.user = user1
booking5.pet = pet5


[ booking1, booking2, booking3, booking4, booking5 ].each do |booking|
  booking.save!
  puts "Created #{booking.status}"
end
puts "Finished!"
