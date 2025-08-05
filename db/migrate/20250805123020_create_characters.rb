class CreateCharacters < ActiveRecord::Migration[7.2]
  def change
    create_table :characters do |t|
      t.integer :stage_number, null: false
      t.string :description, null: false


      t.timestamps
    end
    add_index :characters, :stage_number, unique: true
  end
end
