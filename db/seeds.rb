# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "Cleaning database..."
Booking.destroy_all
Pet.destroy_all
User.destroy_all

puts "Creating users..."


file1 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Poster-sized_portrait_of_Barack_Obama.jpg/1200px-Poster-sized_portrait_of_Barack_Obama.jpg')
user1 = User.new(password: "password", first_name: "Michel", last_name: "Chardou", address: "7 rue Pasteur, 75011 Paris", telephone: "0654756435", description: "J'aime les chatons gris", email: "mich.chardou@gmail.com")
user1.photo.attach(io: file1, filename: 'michel.png', content_type: 'image/png')
user2 = User.new(password: "password", first_name: "Hélène", last_name: "Elegarsson", address: "23 rue Saint-Maur, 75011 Paris", telephone: "0654456015", description: "Amie des bêtes à poils", email: "h.e@gmail.com")
user3 = User.new(password: "password", first_name: "Bertand", last_name: "Chouin", address: "98 avenue de la République, 75011 Paris", telephone: "0634567890", description: "Passioné de grenouilles", email: "bertrand.j@gmail.com")
user4 = User.new(password: "password", first_name: "Ludovic", last_name: "Clochet", address: "102 rue de Ménilmontant, 75020 Paris", telephone: "0612367891", description: "Cherche perruche à chouchouter", email: "ludo.cloclo@gmail.com")
user5 = User.new(password: "password", first_name: "Pierre", last_name: "Présent", address: "5 rue des Nanettes, 75011 Paris", telephone: "0612345678", description: "Aficionado de caniches egyptiens", email: "pierre.present@gmail.com")


[ user1, user2, user3, user4, user5 ].each do |user|
  user.save
  puts "Created #{user.first_name} #{user.last_name}"
end
puts "Finished!"


puts "Creating pets..."
file12 = URI.open('https://www.sciencesetavenir.fr/assets/img/2017/09/14/cover-r4x3w1000-59ba79b28b44f-naruto.jpg')
file13= URI.open('https://ici.exploratv.ca/upload/site/post/picture/784/macaque-950-784.1578492213.jpg')
pet2 = Pet.new(name: "Fonzie", description: "Singe très affecteux et très calme", species: "monkey", price: "80€")
pet2.photos.attach(io: file12, filename: 'coco.png', content_type: 'image/png')
pet2.photos.attach(io: file13, filename: 'coco.png', content_type: 'image/png')
pet2.user = user5

file2 = URI.open('https://www.sciencesetavenir.fr/assets/img/2017/03/29/cover-r4x3w1000-58dbbd655242b-capture-d-e-cran-2017-03-29-a-15-55-40.png')
file3 = URI.open('https://www.sciencesetavenir.fr/assets/img/2020/01/17/cover-r4x3w1000-5e21bf77a1547-chartreux-3298051-1920.jpg')
pet1 = Pet.new(name: "Patatra", description: "Chat blanc doux et calin", species: "cat", price: "15€")
pet1.photos.attach(io: file2, filename: 'patatra.png', content_type: 'image/png')
pet1.photos.attach(io: file3, filename: 'patatra2.png', content_type: 'image/png')
pet1.user = user1

file4 = URI.open('https://static.wamiz.fr/images/news/facebook/article/chien-os-fb-594cdb7b3d78d.jpg')
file5 = URI.open('https://www.wanimo.com/veterinaire/wp-content/uploads/2011/06/images_articles_chien_chien-pate-blessee.jpg')
pet3 = Pet.new(name: "Bouloche", description: "Chien ténébreux", species: "dog", price: "25€")
pet3.photos.attach(io: file4, filename: 'bouloche.png', content_type: 'image/png')
pet3.photos.attach(io: file5, filename: 'bouloche2.png', content_type: 'image/png')
pet3.user = user2

file6 = URI.open('https://images.pexels.com/photos/3687957/pexels-photo-3687957.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
pet6 = Pet.new(name: "Wanchi", description: "Chat timide", species: "cat", price: "20€")
pet6.photos.attach(io: file6, filename: 'wanchi.png', content_type: 'image/png')
pet6.user = user3

file8 = URI.open('https://images.pexels.com/photos/825949/pexels-photo-825949.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
pet4 = Pet.new(name: "Coco", description: "Chien qui aime se deguiser", species: "dog", price: "35€")
pet4.photos.attach(io: file8, filename: 'coco.png', content_type: 'image/png')
pet4.user = user4


file10 = URI.open('https://images.pexels.com/photos/545063/pexels-photo-545063.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
pet5 = Pet.new(name: "Roger", description: "Chien très affectueux mais un peu jaloux", species: "dog", price: "50€")
pet5.photos.attach(io: file10, filename: 'coco.png', content_type: 'image/png')
pet5.user = user5


[ pet1, pet2, pet3, pet4, pet5, pet6 ].each do |pet|
  pet.save!
  puts "Created #{pet.name}"
end
puts "Finished!"

puts "Creating bookings..."
booking1 = Booking.new(status: "deny", start_date: 20191208, end_date: 20191227)
booking1.user = user3
booking1.pet = pet1
booking2 = Booking.new(status: "deny", start_date: 20191229, end_date: 20200110)
booking2.user = user3
booking2.pet = pet1
booking3 = Booking.new(status: "accept", start_date: 20200201, end_date: 20200203)
booking3.user = user5
booking3.pet = pet1
booking4 = Booking.new(status: "accept", start_date: 20200217, end_date: 20200219)
booking4.user = user3
booking4.pet = pet1
booking5 = Booking.new(status: "pending", start_date: 20200120, end_date: 20200122)
booking5.user = user1
booking5.pet = pet5
booking6 = Booking.new(status: "accept", start_date: 20200220, end_date: 20200223)
booking6.user = user4
booking6.pet = pet1
booking7 = Booking.new(status: "pending", start_date: 20200620, end_date: 20200622)
booking7.user = user1
booking7.pet = pet3


[ booking1, booking2, booking3, booking4, booking5, booking6, booking7 ].each do |booking|
  booking.save!
  puts "Created #{booking.status}"
end
puts "Finished!"
