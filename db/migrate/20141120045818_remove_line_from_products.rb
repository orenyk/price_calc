class RemoveLineFromProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.remove :line
    end
  end
end
