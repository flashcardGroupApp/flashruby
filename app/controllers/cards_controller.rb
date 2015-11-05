class CardsController < ApplicationController

  def create
    @deck = Deck.find(params[:id])
    @deck.cards.create(deck_id: params[:id], question: params[:question], anser: params[:answer])

    if @deck.save
      render "create.json.jbuilder", status: :created
    else
      render json: {errors: @user.errors.full_messages },
             status: :unprocessable_entity
      end
  end

  def update
    @deck = Deck.find(params[:id])
    @deck.cards.update(question: params[:question], answer: params[:answer])

    if @deck.save
      render "update.json.jbuilder", status: :updated
    else
      render json: {errors: @user.errors.full_messages},
             status: :unprocessable_entity
    end

  end

  # def destroy
  #   @deck = Deck.find_by(params[:id], )
  #   @deck.cards.destroy
  #
  # end


end
