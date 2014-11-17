class RenameSetToProductSet < ActiveRecord::Migration
  def change
    rename_table :sets, :product_sets
    remove_reference :products, :set
    add_reference :products, :product_set, index: true
  end
end
