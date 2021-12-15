# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Child.destroy_all
VillageMember.destroy_all
Event.destroy_all
Village.destroy_all


nadia =  User.create(first_name: 'Nadia',
              last_name: 'Naji',
              email: 'nadia@turing.edu',
              password: 'password',
              phone_number: '123-456-7777',
              address: '123 Main St Denver, CO 34552',
              covid_vaccinated: true,
              volunteer_credits: 0
               )

anna = User.create(first_name: 'Anna',
              last_name: 'Johnson',
              email: 'anna@turing.edu',
              password: 'password',
              phone_number: '123-456-8888',
              address: '456 Main St Denver, CO 34552',
              covid_vaccinated: true,
              volunteer_credits: 0
               )

phil = User.create(first_name: 'Phil',
             last_name: 'Than',
             email: 'phil@turing.edu',
             password: 'password',
             phone_number: '123-635-7382',
             address: '973 Main St Denver, CO 34552',
             covid_vaccinated: true,
             volunteer_credits: 0
              )

andrew = Child.create(
  first_name: 'Andrew',
  last_name: 'Than',
  birthdate: '1998-03-06',
  user_id: phil.id
)

isika = Child.create(
  first_name: 'Isika',
  last_name: 'Naji',
  birthdate: '2000-01-05',
  user_id: nadia.id
)

jun = Child.create(
  first_name: 'Jun',
  last_name: 'Johnson',
  birthdate: '2000-01-05',
  user_id: anna.id
)

soccer_team = Village.create(
  name: 'Soccer team',
  description: 'Elementary school team for kids under eight. Coached by Ed Edwards'
)

turing= Village.create(
  name: 'Turing',
  description: 'Group of turing students both backend and frontend'
)

bad_moms = Village.create(
  name: 'Bad Moms',
  description: 'Bad mom group--yes, just like in the movie'
)

vm1 = VillageMember.create(
  village: soccer_team ,
  user: phil
)

vm2 = VillageMember.create(
  village: soccer_team ,
  user: anna
)

vm3 = VillageMember.create(
  village: turing,
  user: nadia
)

vm3 = VillageMember.create(
  village: turing,
  user: anna
)

vm3 = VillageMember.create(
  village: bad_moms,
  user: nadia
)

 birthday = Event.create(
  name: 'Andrews birthday bash',
  date: '2012-03-06',
  description: 'come throw down for Andrew',
  time: '04:30',
  adult_required: false,
  village: soccer_team
)
valentine = Event.create(
  name: "Valentine's",
  date: '2022-02-14',
  description: 'Come create an app that makes people fall in love with you!',
  time: '04:00',
  adult_required: false,
  village: turing
)
carrols = Event.create(
  name: 'Christmas Carrols',
  date: '2021-12-25',
  description: 'Spread cheer through the neighborhood',
  time: '04:30',
  adult_required: true,
  village: bad_moms
)
graduation = Event.create(
  name: 'Graduation',
  date: '2022-01-25',
  description: 'Turing students are graduating--time flys!',
  time: '02:30',
  adult_required: true,
  village: turing
)
