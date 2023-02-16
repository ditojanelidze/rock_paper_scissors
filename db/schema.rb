# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_15_221111) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choices", force: :cascade do |t|
    t.string "id_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_rules", force: :cascade do |t|
    t.bigint "player_choice_id"
    t.bigint "computer_choice_id"
    t.integer "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["computer_choice_id"], name: "index_game_rules_on_computer_choice_id"
    t.index ["player_choice_id"], name: "index_game_rules_on_player_choice_id"
  end

  add_foreign_key "game_rules", "choices", column: "computer_choice_id"
  add_foreign_key "game_rules", "choices", column: "player_choice_id"
end
