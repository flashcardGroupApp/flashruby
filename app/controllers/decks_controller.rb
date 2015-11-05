class DecksController < ApplicationController
  before_action :authenticate_user!

  def create
    @deck = Deck.new(user_id: current_user.id, title: params[:title])
    if @deck.save
      render "create.json.jbuilder", status: :created
    else
      render json: {errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    @deck = Deck.find(params[:id])
    render "show.json.jbuilder", status: :ok
  end

   def update
     @deck = Deck.find(params[:id])
     @deck.update(title: params[:title])
     render "update.json.jbuilder", status: :ok
   end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    render "destroy.json.jbuilder", status: :ok
  end

end





