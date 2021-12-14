## Whole Village Back-End(GraphQL)    [![CircleCI](https://circleci.com/gh/Whole-Village/back_end/tree/main.svg?style=shield)](https://circleci.com/gh/Whole-Village/back_end/tree/main)

<div align="center">

<!-- # [Description][description]
[Contributors][contributors-url]
<!-- [![Issues][issues-shield]][issues-url]
[![Stargazers][stars-shield]][stars-url]
[![Forks][forks-shield]][forks-url] -->
<!-- ![Build Badge][build-badge] -->

## Description 
  
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
[API Queries](#api-queries)
[API Mutations](#api-mutations) 
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

  * [System dependencies](https://github.com/Whole-Village/back_end/blob/main/Gemfile)
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
&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Implement Rails as a server-side for GraphQL<br>
&nbsp; &nbsp; ⭐ &nbsp; &nbsp; Set up Cross Origin Resource Sharing (CORS) for the front-end React app to be able to communicate with the server<br>
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

## API Queries
### Find the queries for Whole Village [here](https://github.com/Whole-Village/back_end/wiki/Queries)
  
## API Mutations
### Find the mutations for Whole Village [here](https://github.com/Whole-Village/back_end/wiki/Mutations)
  
</div>

<!-- MARKDOWN LINKS & IMAGES -->

<!-- [contributors-shield]: https://img.shields.io/github/contributors/Whole-Village/back-end.svg?style=flat-square
[contributors-url]: https://github.com/Whole-Village/back-end/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Whole-Village/back-end.svg?style=flat-square
[forks-url]: https://github.com/Whole-Village/back-end/network/members
[stars-shield]: https://img.shields.io/github/stars/Whole-Village/back-end.svg?style=flat-square
[stars-url]: https://github.com/Whole-Village/back-end/stargazers
[issues-shield]: https://img.shields.io/github/issues/Whole-Village/back-end.svg?style=flat-square
[issues-url]: https://github.com/Whole-Village/back-end/issues
[build-badge]: https://img.shields.io/circleci/build/github/Whole-Village/back-end?style=flat-square -->


## Initial JSON Contracts

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
