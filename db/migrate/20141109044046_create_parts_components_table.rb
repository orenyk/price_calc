class CreatePartsComponentsTable < ActiveRecord::Migration
  def change
    create_table :parts_components, id: false do |t|
      t.belongs_to :part
      t.belongs_to :component
    end
  end
end
