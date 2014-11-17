class RenameFamiliesToSets < ActiveRecord::Migration
  def change
    rename_table :families, :sets
  end
end
