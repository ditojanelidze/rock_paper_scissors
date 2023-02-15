class GamesController < ApplicationController

  def choices
    service = ChoicesService.new
    service.call
    render_response service
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