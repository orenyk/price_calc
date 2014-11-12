class UpdateProductsWithMaterialAssociation < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.remove :material
      t.references :material, index: true
    end
  end
end
