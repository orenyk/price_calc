class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :name
      t.decimal :multiple, precision: 12, scale: 3

      t.timestamps
    end
  end
end
