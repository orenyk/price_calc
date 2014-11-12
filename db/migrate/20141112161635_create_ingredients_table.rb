class CreateIngredientsTable < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.belongs_to :product
      t.belongs_to :component

      t.integer :count

      t.timestamps
    end
  end
end
