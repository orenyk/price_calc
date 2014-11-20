class AddProductLineReferenceToProductSets < ActiveRecord::Migration
  def change
    add_reference :product_sets, :product_line, index: true
  end
end
