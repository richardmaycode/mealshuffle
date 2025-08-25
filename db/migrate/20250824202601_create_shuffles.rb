class CreateShuffles < ActiveRecord::Migration[8.0]
  def change
    create_table :shuffles do |t|
      t.string :share_token, null: false
      t.boolean :saved_recipes, default: false
      t.datetime :expiration_date, default: nil
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
