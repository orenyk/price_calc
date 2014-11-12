class CreateProductsTable < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :category, index: true
      t.references :family, index: true

      t.string :name
      t.string :line
      t.string :material
      t.decimal :cost_price, precision: 12, scale: 3

      t.timestamps
    end
  end
end
