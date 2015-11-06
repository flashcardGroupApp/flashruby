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

  def index
    # @deck = Deck.find_all(user_id: params[:userid], title: params[:title])
    # @decks = Deck.order(:created_at => :desc).page(params[:page] || 1).per(10)
    @decks = Deck.all
    #
    # @deck = Deck.where(user_id: current_user.id).find_each
  end
  # :order_by => 'divisions.name DESC'

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





