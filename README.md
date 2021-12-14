## Whole Village Back-End(GraphQL)    [![CircleCI](https://circleci.com/gh/Whole-Village/back_end/tree/main.svg?style=shield)](https://circleci.com/gh/Whole-Village/back_end/tree/main)

<div align="center">

# [WholeVillage](https://whole-village-be.herokuapp.com/)
[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url]
![Build Badge][build-badge]

<img src="https://user-images.githubusercontent.com/73204318/141081548-a93d278d-72ef-4532-9db7-46da0d953c3d.png"><br>
<br>

  An app that allows busy parents to create a villagea and add village members to help out with kids activities as well as creating and organizing events--all in one place.

---

## Contributors

Isika Powers | Andrew Massey
|--- |--- |
|[<img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />](https://github.com/isikapowers)|[<img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />](https://github.com/acmassey3698)|
|[<img src= "https://img.shields.io/badge/in-LinkedIn-blue" />](https://www.linkedin.com/in/isika/)|[<img src= "https://img.shields.io/badge/in-LinkedIn-blue" />](https://www.linkedin.com/in/andrew-massey3698/)


## Table of Contents
|Links
|--- |
[Tools Used](#tools-used)
[Setup](#setup)
[Learning Goals](#learning-goals)
[Database Schema](#database-schema)
[Wireframes](#wireframes)


## Tools Used

|Development|Development|Testing|Deployment
|--- |--- |--- |--- |
|[<img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />](https://www.ruby-lang.org/en/downloads/)|[<img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)|[ <img src="https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/rspec/rspec-rails)|[<img src="https://img.shields.io/badge/Heroku-430098.svg?&style=flaste&logo=heroku&logoColor=white" />](http://virtual-watch-party.herokuapp.com)|
|[ <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />](https://rubygems.org/gems/rails/versions/6.1.4)|[<img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />](https://desktop.github.com/)|[<img src= "https://img.shields.io/badge/ci-circleCI-blue"/>](https://circleci.com/)|
|[<img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://rubygems.org/gems/pry/versions/0.10.3)|[<img src="https://img.shields.io/badge/webmock-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/bblimke/webmock)
|[<img src="https://img.shields.io/badge/sql-postgreSQL-green"/>](https://www.postgresql.org/)|[<img src="https://img.shields.io/badge/-VCR-lightgrey"/>](https://github.com/vcr/vcr)
|[<img src="https://img.shields.io/badge/-Postico-yellowgreen"/>](https://eggerapps.at/postico/)|[<img src="https://img.shields.io/badge/rubocop-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://rubygems.org/gems/rubocop/versions/0.39.0)|[<img src="https://img.shields.io/badge/-FactoryBot-green"/>](https://github.com/thoughtbot/factory_bot)
|[<img src="https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white" />](https://atom.io/)|[<img src="https://img.shields.io/badge/-Faker-blue"/>](https://github.com/faker-ruby/faker)
|[<img src="https://img.shields.io/badge/faraday-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://github.com/lostisland/faraday)||[<img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />](https://rubygems.org/gems/simplecov/versions/0.12.0)|
|[<img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />](https://www.postman.com/product/rest-client/)|

</div>

<div align="center">

## Setup

</div>


  This project requires Ruby 2.7.2.

  * Fork this repository
  * From the command line, install gems and set up your DB:
      * `bundle install && bundle update`
      * `rails db:{create,migrate,seed}`
  * Run the test suite with `bundle exec rspec -fd`
  * Run your development server with `rails s` to see the app in action.

#### Project Configurations

  * Ruby version
      ```bash
      $ ruby -v
      ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
      ```

  * [System dependencies](https://github.com/Whole-Village/frontend/blob/main/Gemfile)
      ```bash
      $ rails -v
      Rails 6.1.4
      ```

  * Database creation
      ```bash
      $ rails db:{drop,create,migrate,seed}
      Created database 'back-end_development'
      Created database 'back-end_test'
      ```

      ```bash
      $ bundle install
      ```

  * How to run the test suite
      ```bash
      $ bundle exec rspec -fd
      ```

  * [Local Deployment](http://localhost:3000), for testing
      ```bash
      $ rails s
      => Booting Puma
      => Rails 6.1.4.1 application starting in development 
      => Run `bin/rails server --help` for more startup options
      Puma starting in single mode...
      * Puma version: 5.5.2 (ruby 3.0.1-p64) ("Zawgyi")
      *  Min threads: 5
      *  Max threads: 5
      *  Environment: development
      *          PID: 7573
      * Listening on http://127.0.0.1:3000
      * Listening on http://[::1]:3000
      Use Ctrl-C to stop
      ```

  * [Heroku Deployment](https://whole-village-be.herokuapp.com/), for production (Note: Since it's GraphQL, no content shows on the page)


<div align="center">

## Learning Goals

</div>


&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Create GraphQL queries and mutations and send them as JSON to the front end to consume<br>
&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Use Rails to create a server-side for GraphQL<br>
&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Create a project with a separate frontend and backend<br>
&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Organize and refactor code to be more maintainable<br>
&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Write model and feature tests that fully cover data logic and both sad and happy paths<br>
&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Utilize Continuous Integration via CircleCI<br>
&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Deploy to Heroku<br>
&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Implement project management by using project boards, participating in daily stand-ups and retros<br>
&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Utilize quality workflow practices: small commits, descriptive pull requests, and code reviews<br>
&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Write thorough, understandable documentation<br>
&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Apply RuboCop’s style guide for code quality<br>

<div align="center">

## Database Schema
![Screen Shot 2021-12-06 at 3 38 10 PM](https://user-images.githubusercontent.com/75844153/144918858-dcb64929-7f83-4022-b247-edcaf25240f3.png)

# API Queries
## Find the queries for Whole Village [here](https://github.com/Whole-Village/back-end/wiki/queries)
  
# API Mutations
## Find the mutations for Whole Village [here](https://github.com/Whole-Village/back-end/wiki/mutations)
  
</div>

<!-- MARKDOWN LINKS & IMAGES -->

[contributors-shield]: https://img.shields.io/github/contributors/Whole-Village/back-end.svg?style=flat-square
[contributors-url]: https://github.com/Whole-Village/back-end/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Whole-Village/back-end.svg?style=flat-square
[forks-url]: https://github.com/Whole-Village/back-end/network/members
[stars-shield]: https://img.shields.io/github/stars/Whole-Village/back-end.svg?style=flat-square
[stars-url]: https://github.com/Whole-Village/back-end/stargazers
[issues-shield]: https://img.shields.io/github/issues/Whole-Village/back-end.svg?style=flat-square
[issues-url]: https://github.com/Whole-Village/back-end/issues
[build-badge]: https://img.shields.io/circleci/build/github/Whole-Village/back-end?style=flat-square




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
