class AddProductLineToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :product_line, index: true
  end
end
