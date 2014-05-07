class AddImportClassToSpreeInventorySyncImports < ActiveRecord::Migration
  def change
    add_column :spree_inventory_sync_imports, :import_class, :string
  end
end
