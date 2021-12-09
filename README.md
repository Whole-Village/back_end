## Whole Village Back-End(GraphQL)    [![CircleCI](https://circleci.com/gh/Whole-Village/back_end/tree/main.svg?style=shield)](https://circleci.com/gh/Whole-Village/back_end/tree/main)

## Schema 

![Screen Shot 2021-12-06 at 3 38 10 PM](https://user-images.githubusercontent.com/75844153/144918858-dcb64929-7f83-4022-b247-edcaf25240f3.png)


## GraphQL Queries

### Find user by email address

```
query {
  user(email:"<email>"){
    firstName
    lastName
    fullName
    email
    phoneNumber
    address
    covidVaccinated
    volunteerCredits
    villages {
      id
      name
      description
    } 
  }
}
```

### Find all users

``` 
query {
  users{
    firstName
    lastName
    fullName
    email
    phoneNumber
    address
    covidVaccinated
    volunteerCredits
    villages {
      id
      name
      description
    } 
  }
}
```

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
[#<User:0x000055f4d9e68d58
  id: 13,
  first_name: "Amber",
  last_name: "Apollo",
  email: "amber@gmail.com",
  password_digest: "[FILTERED]",
  phone_number: "123-456-8888",
  address: "456 Main St Denver, CO 34552",
  covid_vaccinated: true,
  volunteer_credits: "0",
  created_at: Tue, 07 Dec 2021 00:16:15.740112000 UTC +00:00,
  updated_at: Tue, 07 Dec 2021 00:16:15.740112000 UTC +00:00>,
  
 #<User:0x000055f4d9ed2960
  id: 14,
  first_name: "Priya",
  last_name: "Poopoo",
  email: "priya@gmail.com",
  password_digest: "[FILTERED]",
  phone_number: "123-635-7382",
  address: "973 Main St Denver, CO 34552",
  covid_vaccinated: true,
  volunteer_credits: "0",
  created_at: Tue, 07 Dec 2021 00:16:16.334398000 UTC +00:00,
  updated_at: Tue, 07 Dec 2021 00:16:16.334398000 UTC +00:00>,
  
 #<User:0x000055f4d9ed2898
  id: 12,
  first_name: "Bobby",
  last_name: "Doodoo",
  email: "donna@gmail.com",
  password_digest: "[FILTERED]",
  phone_number: "123-456-7777",
  address: "3333 Trial Pl.",
  covid_vaccinated: true,
  volunteer_credits: "0",
  created_at: Tue, 07 Dec 2021 00:16:15.201362000 UTC +00:00,
  updated_at: Wed, 08 Dec 2021 19:05:48.813807000 UTC +00:00>]


[#<Child:0x000055f4da1974e8
  id: 5,
  user_id: 14,
  first_name: "Andrew",
  last_name: "Apples",
  birthdate: "03/06/1998",
  created_at: Tue, 07 Dec 2021 00:16:16.367351000 UTC +00:00,
  updated_at: Tue, 07 Dec 2021 00:16:16.367351000 UTC +00:00>,
  
 #<Child:0x000055f4da1f18a8
  id: 6,
  user_id: 13,
  first_name: "Natalie",
  last_name: "Nabisco",
  birthdate: "01/15/2000",
  created_at: Tue, 07 Dec 2021 00:16:16.384809000 UTC +00:00,
  updated_at: Tue, 07 Dec 2021 00:16:16.384809000 UTC +00:00>]


[#<Village:0x000055f4da34b820
  id: 3,
  name: "Soccer team",
  created_at: Tue, 07 Dec 2021 00:16:16.397096000 UTC +00:00,
  updated_at: Tue, 07 Dec 2021 00:16:16.397096000 UTC +00:00,
  description: "Elementary school team for kids under eight. Coached by Ed Edwards">,
  
 #<Village:0x000055f4da375850
  id: 4,
  name: "Ms. Stewart 3rd Grade class",
  created_at: Tue, 07 Dec 2021 00:16:16.408430000 UTC +00:00,
  updated_at: Tue, 07 Dec 2021 00:16:16.408430000 UTC +00:00,
  description: "All students taught by Ms. Stewart at Main St. Elementary">,
  
 #<Village:0x000055f4da375788
  id: 5,
  name: "Selwyn Village Neighborhood Kids",
  created_at: Tue, 07 Dec 2021 00:16:16.436064000 UTC +00:00,
  updated_at: Tue, 07 Dec 2021 00:16:16.436064000 UTC +00:00,
  description: "Group for all children living in Selwyn Village Neighborhood">]


[#<VillageMember:0x000055f4da56b8d0
  id: 5,
  village_id: 3,
  user_id: 14,
  created_at: Tue, 07 Dec 2021 00:16:16.467909000 UTC +00:00,
  updated_at: Tue, 07 Dec 2021 00:16:16.467909000 UTC +00:00>,
  
 #<VillageMember:0x000055f4da595900
  id: 6,
  village_id: 3,
  user_id: 13,
  created_at: Tue, 07 Dec 2021 00:16:16.484380000 UTC +00:00,
  updated_at: Tue, 07 Dec 2021 00:16:16.484380000 UTC +00:00>,
  
 #<VillageMember:0x000055f4da595838
  id: 7,
  village_id: 4,
  user_id: 14,
  created_at: Tue, 07 Dec 2021 00:16:16.500512000 UTC +00:00,
  updated_at: Tue, 07 Dec 2021 00:16:16.500512000 UTC +00:00>,
  
 #<VillageMember:0x000055f4da595770
  id: 8,
  village_id: 5,
  user_id: 14,
  created_at: Tue, 07 Dec 2021 00:16:16.522360000 UTC +00:00,
  updated_at: Tue, 07 Dec 2021 00:16:16.522360000 UTC +00:00>,
  
 #<VillageMember:0x000055f4da5956a8
  id: 9,
  village_id: 5,
  user_id: 14,
  created_at: Tue, 07 Dec 2021 00:16:16.540669000 UTC +00:00,
  updated_at: Tue, 07 Dec 2021 00:16:16.540669000 UTC +00:00>]
  
  
[#<Event:0x000055f4d7b667b0
  id: 3,
  name: "Andrews birthday bash",
  date: "03/06/1998",
  description: "come throw down for Andrew",
  time: "04:30",
  adult_required: false,
  images: nil,
  created_at: Tue, 07 Dec 2021 00:16:16.561127000 UTC +00:00,
  updated_at: Tue, 07 Dec 2021 00:16:16.561127000 UTC +00:00,
  village_id: 3>,
  
 #<Event:0x000055f4d877ebd8
  id: 4,
  name: "Phils birthday bash",
  date: "03/21/1988",
  description: "come throw down for Phil",
  time: "04:30",
  adult_required: false,
  images: nil,
  created_at: Tue, 07 Dec 2021 00:16:16.576478000 UTC +00:00,
  updated_at: Tue, 07 Dec 2021 00:16:16.576478000 UTC +00:00,
  village_id: 4>,
  
 #<Event:0x000055f4d877ea48
  id: 5,
  name: "Christmas Carrols",
  date: "12/25/2021",
  description: "Spread cheer through the neighborhood",
  time: "04:30",
  adult_required: true,
  images: nil,
  created_at: Tue, 07 Dec 2021 00:16:16.592504000 UTC +00:00,
  updated_at: Tue, 07 Dec 2021 00:16:16.592504000 UTC +00:00,
  village_id: 5>,
  
 #<Event:0x000055f4d877e930
  id: 6,
  name: "Easter Egg Hunt",
  date: "04/25/2022",
  description: "Lets see who can find the most",
  time: "04:30",
  adult_required: true,
  images: nil,
  created_at: Tue, 07 Dec 2021 00:16:16.607268000 UTC +00:00,
  updated_at: Tue, 07 Dec 2021 00:16:16.607268000 UTC +00:00,
  village_id: 4>]

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
