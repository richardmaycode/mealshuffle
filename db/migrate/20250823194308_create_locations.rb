class CreateLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :locations do |t|
      t.integer :platform
      t.string :handle
      t.belongs_to :creator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
