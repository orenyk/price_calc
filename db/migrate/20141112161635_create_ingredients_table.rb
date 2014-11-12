class CreateIngredientsTable < ActiveRecord::Migration
  def change
    create_table :ingredients_tables do |t|
      t.belongs_to :product

      t.integer :count

      t.timestamps
    end
  end
end
