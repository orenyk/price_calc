class CreateProductsComponentsTable < ActiveRecord::Migration
  def change
    create_table :products_components, id: false do |t|
      t.belongs_to :products
      t.belongs_to :component
    end
  end
end
