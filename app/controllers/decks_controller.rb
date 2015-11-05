class DecksController < ApplicationController

  def create
   @deck =  Deck.new(user_id: params[:user_id], #this might just be params :id instead of :user_id
                     title: params[:title])
    if @deck.save
      render "create.json.jbuilder", status: :created
    else
      render json: {errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    @deck = Deck.find_by(title: params[:title])
    render "show.json.jbuilder", status: :ok
  end

   def update
     @deck = Deck.update(title: params[:title])
     render "update.json.jbuilder", status: :updated
   else
     render json: {errors: @user.errors.full_messages },
            status: :unprocessable_entity

   end

  def delete
    @deck = Deck.find_by(title: params[:title])
    @deck.destroy
    render status: :no_content
  end

end





