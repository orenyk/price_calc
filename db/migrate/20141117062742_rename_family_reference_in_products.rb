class RenameFamilyReferenceInProducts < ActiveRecord::Migration
  def change
    remove_reference :products, :family
    add_reference :products, :set, index: true
  end
end
