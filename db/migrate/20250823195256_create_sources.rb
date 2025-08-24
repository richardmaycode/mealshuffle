class CreateSources < ActiveRecord::Migration[8.0]
  def change
    create_table :sources do |t|
      t.string :url, null: false
      t.text :note
      t.belongs_to :recipe, null: false, foreign_key: true
      t.belongs_to :creator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
