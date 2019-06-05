class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :card_content, limit: 50, null: false, default: ''
      t.references :list, foreign_key: true, null: false
      t.integer :position

      t.timestamps
    end
  end
end
