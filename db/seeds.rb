user1 = User.create(
  email: "email@gmail.com",
  password: "12345678"
)

user2 = User.create(
  email: "email2@gmail.com",
  password: "12345678"
)

user3 = User.create(
  email: "email3@gmail.com",
  password: "12345678"
)

user4 = User.create(
  email: "email4@gmail.com",
  password: "12345678"
)

user5 = User.create(
  email: "email5@gmail.com",
  password: "12345678"
)

Profile.create(
  username: "herpderp1",
  location: "Boston, MA",
  avatar_url: "https://s-media-cache-ak0.pinimg.com/236x/50/bb/11/50bb1149e480e46d721d8a813a8ef3d4.jpg",
  pun: "Isn't this punny?!",
  user: user1
)

Profile.create(
  username: "herpderp2",
  location: "Boston, MA",
  avatar_url: "https://s-media-cache-ak0.pinimg.com/236x/50/bb/11/50bb1149e480e46d721d8a813a8ef3d4.jpg",
  pun: "Isn't this punny?!",
  user: user2
)

Profile.create(
  username: "herpderp3",
  location: "Boston, MA",
  avatar_url: "https://s-media-cache-ak0.pinimg.com/236x/50/bb/11/50bb1149e480e46d721d8a813a8ef3d4.jpg",
  pun: "Isn't this punny?!",
  user: user3
)

Profile.create(
  username: "herpderp4",
  location: "Boston, MA",
  avatar_url: "https://s-media-cache-ak0.pinimg.com/236x/50/bb/11/50bb1149e480e46d721d8a813a8ef3d4.jpg",
  pun: "Isn't this punny?!",
  user: user4
)

Profile.create(
  username: "herpderp1",
  location: "Boston, MA",
  avatar_url: "https://s-media-cache-ak0.pinimg.com/236x/50/bb/11/50bb1149e480e46d721d8a813a8ef3d4.jpg",
  pun: "Isn't this punny?!",
  user: user1
)

Profile.create(
  username: "herpderp5",
  location: "Boston, MA",
  avatar_url: "https://s-media-cache-ak0.pinimg.com/236x/50/bb/11/50bb1149e480e46d721d8a813a8ef3d4.jpg",
  pun: "Isn't this punny?!",
  user: user5
)

landmark = Landmark.create(
  name: "Eiffel Tower",
  location: "Paris, FR",
  image: "http://cdn.history.com/sites/2/2015/04/hith-eiffel-tower-iStock_000016468972Large.jpg",
  description: "Very tall, lots of metal.",
  user: user1
)

landmark1 = Landmark.create(
  name: "Pyramids of Giza",
  location: "Egypt",
  image: "https://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg",
  description: "hot, but awesome.",
  user: user1
)

landmark2 = Landmark.create(
  name: "Grand Canyon",
  location: "USA",
  image: "https://media.deseretdigital.com/file/b41fa91284?crop=top:0%7Cleft:0%7Cwidth:1260%7Cheight:670%7Cgravity:Center&resize=width:1260&order=resize,crop&c=14&a=c856f78c",
  description: "SO MUCH SAND",
  user: user2
)

landmark3 = Landmark.create(
  name: "Boston Common",
  location: "Boston, MA",
  image: "http://www.aviewoncities.com/img/boston/kveus115s.jpg",
  description: "THE TREEEEEEESSSSS, also a lot of accents",
  user: user3
)

landmark4 = Landmark.create(
  name: "Tower of Pisa",
  location: "Italy",
  image: "http://vizts.com/wp-content/uploads/2016/03/leaning-tower-of-pisa-italy.jpg",
  description: "It does lean a lot",
  user: user4
)

landmark5 = Landmark.create(
  name: "Golden Gate Bridge",
  location: "San Francisco, USA",
  image: "https://upload.wikimedia.org/wikipedia/commons/a/a4/Ggb_by_night.jpg",
  description: "This bridge needs to be blown up according to the movies.",
  user: user5
)

landmark6 = Landmark.create(
  name: "Great Wall of China",
  location: "China",
  image: "http://www.history.com/s3static/video-thumbnails/AETN-History_VMS/21/115/History_Builders_of_The_Great_Wall_42710_reSF_HD_still_624x352.jpg",
  description: "This was a very, very long walk.",
  user: user2
)

landmark7 = Landmark.create(
  name: "Statue of Liberty",
  location: "NY, NY",
  image: "https://upload.wikimedia.org/wikipedia/commons/a/a1/Statue_of_Liberty_7.jpg",
  description: "It's just... Green... Big whoop.",
  user: user2
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark1,
  user: user1,
  votes: "4",
  landmark_review: "3"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark,
  user: user2,
  votes: "3",
  landmark_review: "2"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark2,
  user: user3,
  votes: "7",
  landmark_review: "1"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark4,
  user: user5,
  votes: "-3",
  landmark_review: "5"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark5,
  user: user4,
  votes: "9",
  landmark_review: "4"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark2,
  user: user3,
  votes: "6",
  landmark_review: "3"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark6,
  user: user5,
  votes: "81",
  landmark_review: "4"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark3,
  user: user1,
  votes: "4",
  landmark_review: "2"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark3,
  user: user1,
  votes: "40",
  landmark_review: "3"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark3,
  user: user1,
  votes: "-10",
  landmark_review: "1"
)

Review.create(
  body: Faker::Hipster.sentence(10),
  landmark: landmark3,
  user: user1,
  votes: "5",
  landmark_review: "5"
)
