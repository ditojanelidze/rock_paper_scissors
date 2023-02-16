# frozen_string_literal: true

class PlayingService
  attr_reader :params, :game_result, :errors

  def initialize(params)
    @params = params
    @errors = []
  end

  def json_view
    { computer_choice: computer_choice.id_name, game_result: }
  end

  def play
    validate_player_choice
    determine_game_result
  end

  def validate_player_choice
    @errors << I18n.t('custom.errors.not_supported_choice') if player_choice.nil?
  end

  def determine_game_result
    return if errors.any?

    @game_result = GameRule.find_by(player_choice_id: player_choice.id,
                                    computer_choice_id: computer_choice.id).result
  end

  def player_choice
    @player_choice ||= Choice.find_by(id_name: params[:player_choice])
  end

  def computer_choice
    @computer_choice ||= if curb_result[:success] && curb_result_choice
                           curb_result_choice
                         else
                           Choice.order('RANDOM()').limit(1).first
                         end
  end

  def curb_result
    @curb_result ||= External::CurbService.call
  end

  def curb_result_choice
    @curb_result_choice ||= Choice.find_by(id_name: curb_result[:choice])
  end
end
