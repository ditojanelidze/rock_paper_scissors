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
    @game_result = GameRule.find_by(player_choice_id: player_choice.id,
                                    computer_choice_id: computer_choice.id).result
  end

  def player_choice
    @player_choice ||= Choice.find_by(id_name: params[:player_choice])
  end

  def computer_choice
    @computer_choice ||= if curb_result[:success]
                           Choice.find_by(id_name: curb_result[:choice])
                         else
                           Choice.order('RANDOM()').limit(1).first
                         end
  end

  def curb_result
    @curb_result ||= External::CurbService.call
  end
end
