json.card do
  json.id @card.id
  json.question @card.question
  json.answer @card.answer
  json.deck do
    json.id @card.deck_id
    json.title @card.deck.title
  end
end