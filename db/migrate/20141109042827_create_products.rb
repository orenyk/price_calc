class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :category

      t.string :name

      t.timestamps
    end
  end
end
