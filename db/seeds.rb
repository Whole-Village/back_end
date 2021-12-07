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


donna =  User.create(first_name: 'Donna',
              last_name: 'Doodoo',
              email: 'donna@gmail.com',
              password: 'password',
              phone_number: '123-456-7777',
              address: '123 Main St Denver, CO 34552',
              covid_vaccinated: true,
              volunteer_credits: 0
               )
amber = User.create(first_name: 'Amber',
              last_name: 'Apollo',
              email: 'amber@gmail.com',
              password: 'password',
              phone_number: '123-456-8888',
              address: '456 Main St Denver, CO 34552',
              covid_vaccinated: true,
              volunteer_credits: 0
               )

priya = User.create(first_name: 'Priya',
             last_name: 'Poopoo',
             email: 'priya@gmail.com',
             password: 'password',
             phone_number: '123-635-7382',
             address: '973 Main St Denver, CO 34552',
             covid_vaccinated: true,
             volunteer_credits: 0
              )

andrew = Child.create(
  first_name: 'Andrew',
  last_name: 'Apples',
  birthdate: '03/06/1998',
  user_id: priya.id
)

natalie = Child.create(
  first_name: 'Natalie',
  last_name: 'Nabisco',
  birthdate: '01/15/2000',
  user_id: amber.id
)

village1 = Village.create(
  name: 'Soccer team,
  description: 'Elementary school team for kids under eight. Coached by Ed Edwards'
)

village2 = Village.create(
  name: 'Ms. Stewart 3rd Grade class',
  description: 'All students taught by Ms. Stewart at Main St. Elementary'
)

village3 = Village.create(
  name: 'Selwyn Village Neighborhood Kids',
  description: 'Group for all children living in Selwyn Village Neighborhood'
)

vm1 = VillageMember.create(
  village: village1,
  user: priya
)

vm2 = VillageMember.create(
  village: village1,
  user: amber
)

vm3 = VillageMember.create(
  village: village2,
  user: priya
)

vm3 = VillageMember.create(
  village: village3,
  user: priya
)

vm3 = VillageMember.create(
  village: village3,
  user: priya
)

event1 = Event.create(
  name: 'Andrews birthday bash',
  date: '03/06/1998',
  description: 'come throw down for Andrew',
  time: '04:30',
  adult_required: false,
  village: village1
)
event2 = Event.create(
  name: 'Phils birthday bash',
  date: '03/21/1988',
  description: 'come throw down for Phil',
  time: '04:30',
  adult_required: false,
  village: village2
)
event1 = Event.create(
  name: 'Christmas Carrols',
  date: '12/25/2021',
  description: 'Spread cheer through the neighborhood',
  time: '04:30',
  adult_required: true,
  village: village3
)
event1 = Event.create(
  name: 'Easter Egg Hunt',
  date: '04/25/2022',
  description: 'Lets see who can find the most',
  time: '04:30',
  adult_required: true,
  village: village2
)
