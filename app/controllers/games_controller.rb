class GamesController < ApplicationController

  def choices
    render json: { choices: Choice.all }
  end

  def play
    service = PlayingService.new(play_params)
    service.play
    render_response service
  end

  private

  def play_params
    params.permit(:player_choice)
  end
end