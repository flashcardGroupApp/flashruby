# Flash Ruby
An API you can use to build a flashcard game

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

## Create a Deck (Authenticated)
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

## Get a Deck Title (Authenticated)
```
GET /decks/:id
```

**Response**

If the deck with that ID is found, you should receive a `200 OK` status code, and a JSON body:

```
{
    "title": "Cast of Flash Gordon"
}
```

## Edit a Deck Title (Authenticated)
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

## Delete a Deck (Authenticated)
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