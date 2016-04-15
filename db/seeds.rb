user_admin = User.create(
  email: "landsnarkr@gmail.com",
  password: "landsnarkradmin",
  role: "admin"
)

user1 = User.create(
  email: "herpina@gmail.com",
  password: "12345678"
)

user2 = User.create(
  email: "herpson@gmail.com",
  password: "12345678"
)

user3 = User.create(
  email: "derpson@gmail.com",
  password: "12345678"
)

user4 = User.create(
  email: "derpina@gmail.com",
  password: "12345678"
)

user5 = User.create(
  email: "derpimir@gmail.com",
  password: "12345678"
)

Profile.create(
  username: "Admin",
  location: "Boston, MA",
  avatar_url: "https://i.ytimg.com/vi/sUOifHlxGiw/hqdefault.jpg",
  pun: "Isn't this punny?!",
  user: user_admin
)

Profile.create(
  username: "Herpina",
  location: "NY, NY",
  avatar_url: "http://shewearsmanyhats.com/wp-content/uploads/2013/07/dipped-ice-cream-cones-7.jpg",
  pun: "This isn't pun anymore.",
  user: user1
)

Profile.create(
  username: "Herpson",
  location: "Chengdu, China",
  avatar_url: "http://screenshots.en.sftcdn.net/en/scrn/189000/189271/minecraft-10-700x393.jpg",
  pun: "Eiffel for you.",
  user: user2
)

Profile.create(
  username: "Derpson",
  location: "Vancouver, BC",
  avatar_url: "http://wiki.teamfortress.com/w/images/f/fa/Stout_Shako.png",
  pun: "What do you call a ray of sunshine? [sunshine].",
  user: user3
)

Profile.create(
  username: "Derpina",
  location: "Rio De Janeiro, Brazil",
  avatar_url: "http://www.onlinestores.com/flagdetective/images/download/brazil-hi.jpg",
  pun: "I cannot believe I got fired from the calendar factory. All I did was take a day off.",
  user: user4
)

Profile.create(
  username: "Derpimir",
  location: "Barcelona, Spain",
  avatar_url: "http://www.teamfortress.com/classless/images/01_soldier_hat.jpg",
  pun: "I'd tell you a chemistry joke but I know I wouldn't get a reaction.",
  user: user5
)

landmark = Landmark.create(
  name: "Eiffel Tower",
  location: "Paris, FR",
  image: "http://cdn.history.com/sites/2/2015/04/hith-eiffel-tower-iStock_000016468972Large.jpg",
  description: "Very tall, lots of metal. Apparently this is super famous or something.",
  user: user1
)

landmark1 = Landmark.create(
  name: "Pyramids of Giza",
  location: "Egypt",
  image: "https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg",
  description: "Hot, but awesome. It took a lot of people to build this. Also, CAMELS.",
  user: user1
)

landmark2 = Landmark.create(
  name: "Grand Canyon",
  location: "USA",
  image: "https://media.deseretdigital.com/file/b41fa91284?crop=top:0%7Cleft:0%7Cwidth:1260%7Cheight:670%7Cgravity:Center&resize=width:1260&order=resize,crop&c=14&a=c856f78c",
  description: "SO MUCH SAND. You can take a donkey ride down.",
  user: user2
)

landmark3 = Landmark.create(
  name: "Boston Common",
  location: "Boston, MA",
  image: "http://www.aviewoncities.com/img/boston/kveus115s.jpg",
  description: "THE TREEEEEEESSSSS, also a lot of accents. The Departed was a lie.",
  user: user3
)

landmark4 = Landmark.create(
  name: "Tower of Pisa",
  location: "Italy",
  image: "http://vizts.com/wp-content/uploads/2016/03/leaning-tower-of-pisa-italy.jpg",
  description: "It does lean a lot, but pretty cool. Lots of stairs.",
  user: user4
)

landmark5 = Landmark.create(
  name: "Golden Gate Bridge",
  location: "San Francisco, USA",
  image: "https://upload.wikimedia.org/wikipedia/commons/a/a4/Ggb_by_night.jpg",
  description: "This bridge needs to be blown up according to the movies. Also, it's very red.",
  user: user5
)

landmark6 = Landmark.create(
  name: "Great Wall of China",
  location: "China",
  image: "http://www.history.com/s3static/video-thumbnails/AETN-History_VMS/21/115/History_Builders_of_The_Great_Wall_42710_reSF_HD_still_624x352.jpg",
  description: "This was a very, very long walk. They built this to keep the Mongols out!",
  user: user2
)

Landmark.create(
  name: "Statue of Liberty",
  location: "NY, NY",
  image: "https://upload.wikimedia.org/wikipedia/commons/a/a1/Statue_of_Liberty_7.jpg",
  description: "It's just... Green... Big whoop. A gift from France, according to the tour guide.",
  user: user2
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark1,
  user: user1,
  landmark_rating: "3"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark,
  user: user2,
  landmark_rating: "2"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark2,
  user: user3,
  landmark_rating: "1"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark4,
  user: user5,
  landmark_rating: "5"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark5,
  user: user4,
  landmark_rating: "4"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark2,
  user: user3,
  landmark_rating: "3"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark6,
  user: user5,
  landmark_rating: "4"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark3,
  user: user5,
  landmark_rating: "2"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark3,
  user: user3,
  landmark_rating: "3"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark3,
  user: user3,
  landmark_rating: "1"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark3,
  user: user4,
  landmark_rating: "5"
)
