class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name
      t.decimal :price, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end