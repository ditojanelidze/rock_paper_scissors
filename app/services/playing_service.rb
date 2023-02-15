class PlayingService

  attr_reader :params, :result

  def initialize(params)
    @params = params
    @errors = []
  end

  def json_view
    { curb_result:, result: }
  end

  def play
    @result = GameRule.where(player_choice_id: player_choice.id,
                             computer_choice_id: computer_choice.id).result
  end

  def player_choice
    @player_choice ||= Choice.find_by(id_name: params[:player_choice])
  end

  def computer_choice
    @computer_choice ||= Choice.find_by(id_name: curb_result[:choice])
  end

  def curb_result
    @curb_result ||= External::CurbService.call
  end
end
