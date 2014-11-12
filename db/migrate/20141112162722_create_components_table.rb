class CreateComponentsTable < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.belongs_to :type

      t.string :name
      t.decimal :cost, precision: 12, scale: 3

      t.timestamps
    end
  end
end
