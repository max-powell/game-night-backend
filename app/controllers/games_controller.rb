require 'net/http'
require 'JSON'

class GamesController < ApplicationController

  def index
    if params['name']
      res = RestClient.get("https://www.boardgameatlas.com/api/search?name=#{params['name']}&client_id=#{Rails.application.credentials.dig(:bga_api_key)}")
      results = JSON.parse(res)['games'][0..14].map do |r|
        {
          name: r['name'],
          min_players: r['min_players'],
          max_players: r['max_players'],
          min_playtime: r['min_playtime'],
          max_playtime: r['max_playtime'],
          description: r['description_preview'],
          image_url: r['thumb_url']
        }
      end
      render json: results
    else
      render json: current_user.games
    end
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
