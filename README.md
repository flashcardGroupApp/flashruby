# Flash Ruby
An API you can use to build a flashcard game. The server is located at: [http://secret-shore-7735.herokuapp.com/](http://secret-shore-7735.herokuapp.com/)

# API
### Authentication Notes

To make an authenticated request in any case other than registering or deleting an account, you must supply an `Access-Token` header with a valid access token. Otherwise you'll receive a `401 Forbidden` error and everyone will laugh at you.

## Registering An Account

```
POST /signup
```

**Params**

`email`: `String` An email address. *Must be unique*<br>
`username`: `String` A user name. *Must be unique*<br>
`password`: `String` A password.

**Response**

If the user was created successfully you should receive a `201 Created` status code, and a JSON body:

```
{
    "user": {
        "id": 10,
        "username": "flashgordon",
        "email": "flash@ahhh.com",
        "access_token": "8bbd7dad6b2e8965ee2bf02dc8181f74"
    }
}
```

If the user could not be created, it's because you screwed up. You should receive a `422 Unprocessable Entity` status code, and a JSON body:

```
{
    "errors": [
        "Email has already been taken",
        "Username has already been taken",
        "Your password is weak and will be crushed"
    ]
}
```

## Deleting An Account
```
DELETE /signup
```

**Params**
`email`: `String` Your user account's email address.<br>
`password`: `String` Your user account's password.

**Response**

We are sorry if we offended you. If the request is successful, you should receive a `204 No Content` status code.

If the user could not be deleted, you should receive a `401 Unauthorized` status code, and a JSON body:

```
{
    "errors": [
        "Email not found",
        "Your password was wrong and you should be sorry"
    ]
}
```

## Logging In
```
POST /login
```

**Params**

`username`: `String`<br>
`password`: `String`

**Response**

If the user information was correct, you should receive a `200 OK` status code, and a JSON body:
```
{
    "access_token" : "8bbd7dad6b2e8965ee2bf02dc8181f74"
}
```

If the user information was not correct, you should receive a `401 Unauthorized` status code, and a JSON body:
```
{
    "errors": [
        "Email not found",
        "Your password was wrong and you should be sorry"
    ]
}
```

## Create a Deck
```
POST /decks
```

**Params**

`title`: `String`

**Response**

If the deck creation was successful, you should receive a `201 Created` status code, and a JSON body:
```
{
    "id": 123,
    "user_id": 5,
    "title": "Cast of Flash Gordon"
}
```

## Show a Deck
```
GET /decks/:id
```

**Response**

If the deck with that ID is found, you should receive a `200 OK` status code, and a JSON body:

```
{
  "title": "Cast of Flash Gordon",
  "deck": [
    {
      "id": 1,
      "question": "Sam J. Jones",
      "answer": "Flash Gordon"
    },
    {
      "id": 3,
      "question": "Melody Anderson",
      "answer": "Dale Arden"
    }
  ]
}
```

## Show All Decks
```
GET /decks
```

**Response**

Lists an array of all decks in the database. You should receive a `200 OK` status code, and a JSON body:
```
[
  {
    "id": 1,
    "user_id": 1,
    "title": "Cast of Flash Gordon"
  },
  {
    "id": 2,
    "user_id": 1,
    "title": "Cast of Saturday Night Fever"
  }
]
```

## Edit a Deck Title
```
PUT /decks/:id
```

**Params**
`title`: `String`

**Response**

If the update was successful, you should receive a `200 OK` status code, and a JSON body:

```
{
    "title": "Cast of Rocky Horror Picture Show"
}
```

## Delete a Deck
```
DELETE /decks/:id
```

**Response**

If the deck was successfully deleted, you should receive a `200 OK` status code, and a JSON body:

```
{
    "delete": "Success"
}
```

## Show a Single Card
```
GET /cards/:id
```

**Response**

If the card was successfully found, you should receive a `200 OK` status code and a JSON body:
```
{
  "card": {
    "id": 1,
    "question": "Max von Sydow",
    "answer": "Ming the Merciless"
  }
}
```

## Create a Card
```
POST /deck/:id/cards
```

**Params**
`question`: `String`<br>
`answer`: `String`

**Response**

If the card creation was successful, you should receive a `201 Created` status code, and a JSON body:
```
{
  "card": {
    "id": 9,
    "question": "Chaim Topol",
    "answer": "Dr. Hans Zarkov"
  }
}
```

## Edit a Card
```
PUT /cards/:id
```

**Params**
`question`: `String`<br>
`answer`: `String`

**Response**

If the card update was successful, you should receive a `200 OK` status code, and a JSON body:
```
{
  "card": {
    "id": 9,
    "question": "Tim Curry",
    "answer": "Dr. Frank-N-Furter"
  }
}
```

## Delete a Card
```
DELETE /cards/:id
```

**Response**

If the card was successfully deleted, you should receive a `200 OK` status code, and a JSON body:
```
{
    "delete": "Success"
}
```