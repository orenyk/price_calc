class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name
      t.decimal :cost, precision: 12, scale: 3

      t.timestamps
    end
  end
end
