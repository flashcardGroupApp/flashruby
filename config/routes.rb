Rails.application.routes.draw do
  ## USER ROUTES
  post "/signup", to: "registrations#create"
  delete "/signup", to: "registrations#destroy"
  post "/login", to: "registrations#login"

  ## DECK ROUTES
  get "decks/", to: "decks#index"
  get "decks/:id", to: "decks#show", as: "deck"
  post "decks", to: "decks#create"
  put "decks/:id", to: "decks#update"
  delete "decks/:id", to: "decks#destroy"

  ## CARD ROUTES
  get "cards/:id", to: "cards#show", as: "card"
  post "deck/:id/cards", to: "cards#create"
  put "cards/:id", to: "cards#update"
  delete "cards/:id", to: "cards#destroy"

  ## GUESS ROUTES
  get "deck/:id/guesses", to: "guesses#show", as: "guess"
  post "cards/:id/guesses", to: "guesses#create"
  get "deck/:id/score", to: "guesses#score"
end
