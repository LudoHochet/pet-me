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
user1 = User.new(password: "password", first_name: "Michel", last_name: "Chardou", address: "7 boulevard pasteur, 75015", telephone: "0654756435", description: "J'aime les chatons gris", email: "mich.chardou@gmail.com")
user1.photo.attach(io: file1, filename: 'michel.png', content_type: 'image/png')
user2 = User.new(password: "password", first_name: "Hélène", last_name: "Elegarsson", address: "134 rue du faubourg saint-martin, paris", telephone: "0654456015", description: "Amie des bêtes à poils", email: "h.e@gmail.com")
user3 = User.new(password: "password", first_name: "Bertand", last_name: "Chouin", address: "2 passage du havre, paris", telephone: "0634567890", description: "Passioné de grenouilles", email: "bertrand.j@gmail.com")
user4 = User.new(password: "password", first_name: "Ludovic", last_name: "Clochet", address: "1 avenue marceau, paris", telephone: "0612367891", description: "Cherche perruche à chouchouter", email: "ludo.cloclo@gmail.com")
user5 = User.new(password: "password", first_name: "Pierre", last_name: "Présent", address: "12 rue des ternes, paris", telephone: "0612345678", description: "Aficionado de caniches egyptiens", email: "pierre.present@gmail.com")


[ user1, user2, user3, user4, user5 ].each do |user|
  user.save
  puts "Created #{user.first_name} #{user.last_name}"
end
puts "Finished!"


puts "Creating pets..."
file2 = URI.open('https://www.sciencesetavenir.fr/assets/img/2017/03/29/cover-r4x3w1000-58dbbd655242b-capture-d-e-cran-2017-03-29-a-15-55-40.png')
file3 = URI.open('https://www.sciencesetavenir.fr/assets/img/2020/01/17/cover-r4x3w1000-5e21bf77a1547-chartreux-3298051-1920.jpg')
pet1 = Pet.new(name: "Patatra", description: "Chat blanc doux et calin", species: "cat", price: "600€")
pet1.photos.attach(io: file2, filename: 'patatra.png', content_type: 'image/png')
pet1.photos.attach(io: file3, filename: 'patatra2.png', content_type: 'image/png')
pet1.user = user1

file4 = URI.open('https://static.wamiz.fr/images/news/facebook/article/chien-os-fb-594cdb7b3d78d.jpg')
file5 = URI.open('https://www.wanimo.com/veterinaire/wp-content/uploads/2011/06/images_articles_chien_chien-pate-blessee.jpg')
pet2 = Pet.new(name: "Bouloche", description: "Chien ténébreux", species: "dog", price: "200€")
pet2.photos.attach(io: file4, filename: 'bouloche.png', content_type: 'image/png')
pet2.photos.attach(io: file5, filename: 'bouloche2.png', content_type: 'image/png')
pet2.user = user2

file6 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Mouse-19-Dec-2004.jpg/520px-Mouse-19-Dec-2004.jpg')
file7 = URI.open('https://produit-antinuisible.com/img/cms/souris-grise-souris-domestique.jpg')
pet3 = Pet.new(name: "Wanchi", description: "Souris verte qui aime courir dans l'herbe", species: "mouse", price: "50€")
pet3.photos.attach(io: file6, filename: 'wanchi.png', content_type: 'image/png')
pet3.photos.attach(io: file7, filename: 'wanchi2.png', content_type: 'image/png')
pet3.user = user3

file8 = URI.open('https://static.actu.fr/uploads/2019/05/vache-Pixabay-854x528.jpg')
file9 = URI.open('https://img.bfmtv.com/c/1256/708/a053005f3/fa2ae1e43b83eee10a09649.jpg')
pet4 = Pet.new(name: "Coco", description: "Vache qui aime rire", species: "dog", price: "500€")
pet4.user = user4
pet4.photos.attach(io: file8, filename: 'coco.png', content_type: 'image/png')
pet4.photos.attach(io: file9, filename: 'coco2.png', content_type: 'image/png')


file10 = URI.open('https://www.zooplus.fr/magazine/wp-content/uploads/2018/10/american-pit-bull-terrier-im-grass-1024x682.jpg')
file11= URI.open('https://storage.googleapis.com/stateless-lactualite-com/2016/05/pitbull-large.jpg')
pet5 = Pet.new(name: "Cookie", description: "Chien très affectueux mais un peu jaloux", species: "dog", price: "150€")
pet5.photos.attach(io: file10, filename: 'coco.png', content_type: 'image/png')
pet5.photos.attach(io: file11, filename: 'coco.png', content_type: 'image/png')
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
booking6 = Booking.new(status: false, start_date: 20200220, end_date: 20200223)
booking6.user = user4
booking6.pet = pet1


[ booking1, booking2, booking3, booking4, booking5, booking6 ].each do |booking|
  booking.save!
  puts "Created #{booking.status}"
end
puts "Finished!"
