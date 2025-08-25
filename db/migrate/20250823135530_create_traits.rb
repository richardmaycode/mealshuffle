class CreateTraits < ActiveRecord::Migration[8.0]
  def change
    create_table :traits do |t|
      t.string :name, null: false
      t.integer :category, null: false, default: 0
      t.integer :recipe_traits_count, default: 0

      t.timestamps
    end
  end
end
