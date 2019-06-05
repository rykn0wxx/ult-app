class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :board_name, limit: 20, null: false, default: ''
      t.string :board_description, null: false, default: ''
      t.references :user, foreign_key: true, null: false
      t.integer :position

      t.timestamps
    end
  end
end
