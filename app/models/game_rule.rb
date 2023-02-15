class GameRule < ApplicationRecord
  belongs_to :player_choice, class_name: 'Choice'
  belongs_to :computer_choice, class_name: 'Choice'
end