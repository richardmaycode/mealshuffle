class CreateShuffleRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :shuffle_recipes do |t|
      t.integer :status, null: false, default: 0
      t.integer :position, null: false, default: 0
      t.belongs_to :shuffle, null: false, foreign_key: true
      t.belongs_to :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
