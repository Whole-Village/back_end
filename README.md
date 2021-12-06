## Whole Village Back-End(GraphQL)    [![CircleCI](https://circleci.com/gh/Whole-Village/back_end/tree/main.svg?style=shield)](https://circleci.com/gh/Whole-Village/back_end/tree/main)

## Schema 

![Screen Shot 2021-12-06 at 3 38 10 PM](https://user-images.githubusercontent.com/75844153/144918858-dcb64929-7f83-4022-b247-edcaf25240f3.png)

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
