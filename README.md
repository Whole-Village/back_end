## Whole Village Back-End(GraphQL)    [![CircleCI](https://circleci.com/gh/Whole-Village/back_end/tree/main.svg?style=shield)](https://circleci.com/gh/Whole-Village/back_end/tree/main)

## Schema 

![Screen Shot 2021-12-06 at 3 38 10 PM](https://user-images.githubusercontent.com/75844153/144918858-dcb64929-7f83-4022-b247-edcaf25240f3.png)


## GraphQL Queries

### Create an event

 ```
 mutation {
  createEvent( 
    villageId: 23
    name: "New Year Celebration"
    description: "Come celebrate with us!"
    date: "01/01/2022"
    time: "10:30am"
    adultRequired: true
  ) {
    event {
      id
      name
      description
      date
      time
      adultRequired
      villageName
    }
    errors
  }
}
```

### Update an event partially (pass new data you want to update in the params.  Event Id is required.

 ```
 mutation {
   updateEvent(
     id: <event_id>,
     name: "<new name"
   ) {
     event {
       id
       name
       description
     }
     errors
   }
 }

 ```

### Find all events in a village

 ```
 query {
  events(villageId: <villageId>) {
    name
    description
    date
    time
    adultRequired
    villageName
  }
}
```

## Find an event by ID.  Event ID is required

```
query {
  event(id: <event_id>){
    name
    description
    date
    time
    adultRequired
    villageName
  }
}
```

## Seed Data

```
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
  name: 'Soccer team',
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

 birthday = Event.create(
  name: 'Andrews birthday bash',
  date: '03/06/1998',
  description: 'come throw down for Andrew',
  time: '04:30',
  adult_required: false,
  village: village1
)
valentine = Event.create(
  name: "Valentine's",
  date: '02/14/2022',
  description: 'come celebrate the big V day with Phil',
  time: '04:30',
  adult_required: false,
  village: village2
)
carrols = Event.create(
  name: 'Christmas Carrols',
  date: '12/25/2021',
  description: 'Spread cheer through the neighborhood',
  time: '04:30',
  adult_required: true,
  village: village3
)
easter = Event.create(
  name: 'Easter Egg Hunt',
  date: '04/25/2022',
  description: 'Lets see who can find the most',
  time: '04:30',
  adult_required: true,
  village: village2
)
```

## JSON Contracts

```
singular user
{
  data: {
     "id": string,
     "type": user,
       attributes: {
         "first_name": string,
         "last_name": string,
         "email": string,
         "password": string,
         "phone_number": string,
         "address": string,
         "covid_vaccinated": boolean,
         "volunteer_credits": string, 
         "children": [
          {
            "id": string,
            "type": child,
            "attributes": {
              "first_name": string,
              "last_name": string,
              "birthday": string
            }
          },
         ]
         "villages": [
          {
            "id": string,
            "type": "village",
            "attributes": {
              name: string
            }
          },
         ]
    }
  }
}

singular village

{
  data: {
    "id": string,
    "type": village,
    "attributes": {
      "name": string,
      "events": [
        {
          "id": string,
          "type": event,
          "attributes": {
            "name": string,
            "date": string,
            "description": string,
            "time": string,
            "adult_required": boolean 
          }
        }
      ]    
    }    
  }
}
```
