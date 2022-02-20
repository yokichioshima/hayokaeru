class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :name, null: false
      t.integer :category_id, null: false
      t.string :quantity_unit, null: false
      t.string :options
      t.timestamps
    end
  end
end