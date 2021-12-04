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
