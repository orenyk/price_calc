class UpdateComponentsTable < ActiveRecord::Migration
  def change
    remove_reference :components, :type
    add_reference :components, :component_type, index: true
  end
end
