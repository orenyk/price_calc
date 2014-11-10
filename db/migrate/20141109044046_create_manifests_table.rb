class CreateManifestsTable < ActiveRecord::Migration
  def change
    create_table :manifests do |t|
      t.references :component, index: true
      t.references :product, index: true

      t.decimal :unit_cost, precision: 12, scale: 3
      t.integer :count
      t.decimal :total_cost, precision: 12, scale: 3

      t.timestamps
    end
  end
end
