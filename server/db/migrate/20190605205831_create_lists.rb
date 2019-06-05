class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :list_name, limit: 20, null: false, default: ''
      t.string :list_description, null: false, default: ''
      t.references :board, foreign_key: true, null: false
      t.integer :position

      t.timestamps
    end
  end
end
