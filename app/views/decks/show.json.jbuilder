json.title @deck.title
json.deck do
  json.array! @deck.cards do |card|
    json.id card.id
    json.question card.question
    json.answer card.answer
  end
end