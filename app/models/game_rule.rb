# frozen_string_literal: true

class GameRule < ApplicationRecord

  WIN = 'win'
  LOSE = 'lose'
  TIE = 'tie'

  belongs_to :player_choice, class_name: 'Choice'
  belongs_to :computer_choice, class_name: 'Choice'

  enum result: {
    lose: 0,
    win: 1,
    tie: 2
  }
end
