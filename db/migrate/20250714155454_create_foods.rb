class CreateFoods < ActiveRecord::Migration[7.2]
  def change
    create_table :foods do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true, null: false
      t.string :name, null: false
      t.integer :quantity, null: false
      t.string :unit, null: false
      t.integer :default_deadline
      t.string :food_image

      t.timestamps
    end

    add_index :foods, [ :category_id, :name ]
    add_index :foods, [ :user_id, :name ], unique: true
    add_index :foods, :name, unique: true, where: "user_id IS NULL"
  end
end
