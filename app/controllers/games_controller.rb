class GamesController < ApplicationController

  def index
    user = User.find(params[:user_id])
    render json: user.games
  end

  def update
    game = Game.find(params[:id])
    byebug
    game.update(game_params)
    render json: game
  end

  private

  def game_params
    params.require(:game).permit(:name, :min_players, :max_players, :min_playtime, :max_playtime, :description, :image_url, owner_ids: [])
  end

end
