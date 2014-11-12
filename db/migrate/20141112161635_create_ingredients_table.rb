class CreateIngredientsTable < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.references :product, index: true
      t.references :component, index: true

      t.integer :count
      t.decimal :unit_cost, precision: 12, scale: 3
      t.decimal :total_cost, precision: 12, scale: 3

      t.timestamps
    end
  end
end
