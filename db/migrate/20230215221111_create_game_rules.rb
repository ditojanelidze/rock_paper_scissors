class CreateGameRules < ActiveRecord::Migration[7.0]
  def change
    create_table :game_rules do |t|
      t.references :player_choice, foreign_key: {to_table: :choices}
      t.references :computer_choice, foreign_key: {to_table: :choices}
      t.integer :result
      t.timestamps
    end
  end
end
