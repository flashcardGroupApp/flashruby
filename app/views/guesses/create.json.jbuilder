json.guess do
  json.user_id  @guess.user_id
  json.card_id  @guess.card_id
  json.duration @guess.duration
  json.correct  @guess.correct
end





