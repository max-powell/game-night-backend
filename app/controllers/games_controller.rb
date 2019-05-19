class GamesController < ApplicationController

  def index
    render json: current_user.games
  end

  def create
    game = Game.where(name: game_params[:name]).first_or_create(game_params)
    current_user.games << game
    render json: game
  end

  def user_games
    user = User.find(params[:user_id])
    render json: user.games
  end

  private

  def game_params
    params.require(:game).permit(:name, :min_players, :max_players, :min_playtime, :max_playtime, :description, :image_url)
  end

end
