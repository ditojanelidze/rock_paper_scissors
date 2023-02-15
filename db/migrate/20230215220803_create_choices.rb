class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.string :id_name, null: false
      t.timestamps
    end
  end
end
