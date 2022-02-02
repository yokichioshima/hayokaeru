class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :sort_id, null: false
      t.string :options
      t.timestamps
    end
  end
end
