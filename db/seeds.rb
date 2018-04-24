# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:             "foobar",
             password_confirmation: "foobar",
             admin: true)
40.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
                email: email,
                password:             password,
                password_confirmation: password)
end

Autor.create!(first_name: "Haruki",
               second_name: "Murakami")

Autor.create!(first_name: "Frederic",
               second_name: "Beigbeder")

Autor.create!(first_name: "Paulo",
               second_name: "Coelho")

Autor.create!(first_name: "Chuck",
               second_name: "Palahniuk")


autors = Autor.order(:created_at).take(4)
20.times do |n|
  title = Faker::Book.title
  text = "Batfish lake whitefish flathead catfish cuskfish betta piranha elephantnose fish porcupinefish northern clingfish golden shiner bala shark? Velvet-belly shark, madtom flathead catfish Australian prowfish shiner great white shark. Antarctic cod, river shark oceanic flyingfish ricefish dealfish dwarf gourami milkfish armoured catfish; ghost flathead Rainbow trout Ganges shark. Sweeper tui chub deepwater cardinalfish velvet catfish gray reef shark murray cod. Burma danio kappy burbot javelin, barbelless catfish rock beauty shark blue-redstripe danio pink salmon, dogfish shark! Inconnu Razorback sucker aholehole shortnose chimaera ribbonbearer rivuline. Frogfish, glass knifefish, tope, Pacific herring stickleback velvet-belly shark tonguefish mahseer dragonet sheepshead minnow jackfish. Loosejaw roosterfish shortnose greeneye aholehole splitfin convict cichlid burma danio Long-finned sand diver duckbilled barracudina spinefoot zebra loach.
     Grayling, kokopu desert pupfish sheepshead minnow bigscale: devil ray mudminnow seamoth tripod fish stickleback. Blackchin southern flounder jewel tetra velvet catfish sculpin. Freshwater flyingfish, jewelfish; yellowtail snapper bent-tooth, speckled trout loach goby. Sheepshead minnow peamouth longfin peladillo skipjack tuna pike spiny eel Asian carps, king of herring speckled trout Hammerjaw. Sucker bango candiru vimba false trevally ricefish rivuline, cookie-cutter shark Moorish idol shortnose greeneye. Alfonsino turkeyfish rough scad sea dragon discus, blue danio, sawfish forehead brooder tuna Colorado squawfish--beaked sandfish mola: ray redmouth whalefish: false cat shark.
     Driftwood catfish madtom freshwater herring riffle dace; flat loach Russian sturgeon. Mudminnow gouramie straptail, ling cod pupfish mosquitofish brook trout. Squarehead catfish arowana tilefish steelhead white croaker: pearl danio; pearlfish collared dogfish, ropefish freshwater shark megamouth shark. Pirarucu Modoc sucker orbicular velvetfish; bocaccio carpsucker Death Valley pupfish humuhumunukunukuapuaa. Ide Sacramento splittail: salmon shark bichir alfonsino jellynose fish pigfish greeneye, earthworm eel bango ziege sind danio. Codling spotted danio. Snoek bigeye squaretail ribbonfish seatrout Reef triggerfish, dusky grouper waryfish gopher rockfish Pacific albacore lake trout wrasse beluga sturgeon African glass catfish."
  images = ['1.jpg','2.jpg','3.jpg','4.jpg']

  images.map! { |i|  File.open("#{Dir.pwd}/public/#{i}") }
  autors.each { |autor| autor.books.create!(name: title,
                                            picture: images[0],
                                            description: text) }
end 

20.times do |n|
  title = Faker::Lorem.sentence(5)
  book = Book.first
  if(n == 0)
    Comment.create!(book_id: 1,
                  activ: true,
                  user_id: 1,
                  info: title)
  else
    Comment.create!(book_id: 1,
                    activ: true,
                    user_id: n,
                    info: title)
  end
end

10.times do |n|
  user = User.first
  book = Book.find(n+1)
  InterimTable.create!(book_id: book.id,
                          user_id: user.id)
end