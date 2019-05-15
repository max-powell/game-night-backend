class GamesController < ApplicationController

  def index
    user = User.find(params[:user_id])
    render json: user.games
  end

end
