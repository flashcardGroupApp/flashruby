class CardsController < ApplicationController

  def create
    @deck = Deck.find(params[:id])
    @deck.cards.create(question: params[:question], anser: params[:answer])

    if @deck.save
      render "create.json.jbuilder", status: :created
    else
      render json: {errors: @user.errors.full_messages },
             status: :unprocessable_entity
      end
  end

  def update
    ## logic to make sure params aren't empty
    ## logic to make sure user is allowed to update card (belong to user)
    @card = Card.find(params[:id])
    @card.update(question: params[:question], answer: params[:answer])
    render "update.json.jbuilder", status: :ok

  end

   def destroy
     @card = Card.find(params[:id])
     @card.destroy

   end


end
