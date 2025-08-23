class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.integer :servings

      t.references :creator, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
