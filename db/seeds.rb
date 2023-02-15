rock    = Choice.find_or_create_by(id_name: :rock)
paper   = Choice.find_or_create_by(id_name: :paper)
scissor = Choice.find_or_create_by(id_name: :scissor)

GameRule.find_or_create_by(player_choice: rock, computer_choice: paper, result: :lose)
GameRule.find_or_create_by(player_choice: rock, computer_choice: scissor, result: :win)

GameRule.find_or_create_by(player_choice: paper, computer_choice: scissor, result: :lose)
GameRule.find_or_create_by(player_choice: paper, computer_choice: rock, result: :win)

GameRule.find_or_create_by(player_choice: scissor, computer_choice: paper, result: :win)
GameRule.find_or_create_by(player_choice: scissor, computer_choice: rock, result: :lose)

# Ties
GameRule.find_or_create_by(player_choice: rock, computer_choice: rock, result: :tie)
GameRule.find_or_create_by(player_choice: scissor, computer_choice: scissor, result: :tie)
GameRule.find_or_create_by(player_choice: paper, computer_choice: paper, result: :tie)
