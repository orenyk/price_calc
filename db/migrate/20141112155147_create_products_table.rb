class CreateProductsTable < ActiveRecord::Migration
  def change
    create_table :products_tables do |t|
      t.belongs_to :category
      t.belongs_to :family

      t.string :name
      t.string :line
      t.string :material
      t.decimal :cost_price, precision: 12, scale: 3

      t.timestamps
    end
  end
end
