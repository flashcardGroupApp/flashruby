json.array! @guess do |guess|
  json.id guess.id
  json.card_id guess.card_id
  json.user_id guess.user_id
  json.duration guess.duration
  json.correct guess.correct
end