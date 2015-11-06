class CardsController < ApplicationController
 before_action :authenticate_user!

  def show
    @card = Card.find(params[:id])
    render "show.json.jbuilder", status: :ok
  end

  def create
    @deck = Deck.find(params[:id])
    @deck.cards.new(question: params[:question], answer: params[:answer])

    if @deck.save
      @card = Card.last
      render "create.json.jbuilder", status: :created
    else
      render json: {errors: @user.errors.full_messages },
             status: :unprocessable_entity
      end
  end

  def update
    @card = Card.find(params[:id])
    @card.update(question: params[:question], answer: params[:answer])

    if @card.save
      render "update.json.jbuilder", status: :updated
    else
      render json: {errors: @user.errors.full_messages},
             status: :unprocessable_entity
    end

  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
  end


end
