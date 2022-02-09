class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name, null: false
      t.integer :product_1_id, foreign_key: true
      t.integer :product_2_id, foreign_key: true
      t.integer :product_3_id, foreign_key: true
      t.integer :product_4_id, foreign_key: true
      t.integer :product_5_id, foreign_key: true
      t.timestamps
    end
  end
end
