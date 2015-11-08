class GuessesController < ApplicationController
  before_action :authenticate_user!

  def create
    @guess = Guess.new(user_id: current_user.id, card_id: params[:card_id],
                       duration: params[:duration],
                       correct: params[:correct] == "true" ? true : false)

    if @guess.save
      render "create.json.jbuilder", status: :created
    else
      render json: {errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    join = 'LEFT OUTER JOIN cards ON cards.id = guesses.card_id'
    search_params = {cards: {deck_id: params[:id]},
                    guesses: {user_id: current_user.id}}
    @guess = Guess.joins(join).where(search_params)
    render "show.json.jbuilder", status: :ok
  end

  def score
    @score = Guess.where(user_id: current_user.id).count(:correct)
    render "score.json.jbuilder", status: :ok
  end
end



