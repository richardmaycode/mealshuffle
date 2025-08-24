class CreateShuffleTraits < ActiveRecord::Migration[8.0]
  def change
    create_table :shuffle_traits do |t|
      t.belongs_to :shuffle, null: false, foreign_key: true
      t.belongs_to :trait, null: false, foreign_key: true

      t.timestamps
    end
  end
end
