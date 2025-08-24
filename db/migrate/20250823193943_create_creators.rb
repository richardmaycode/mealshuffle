class CreateCreators < ActiveRecord::Migration[8.0]
  def change
    create_table :creators do |t|
      t.string :display_name, null: false

      t.timestamps
    end
  end
end
