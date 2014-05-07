class AddOptionsToSpreeInventorySyncImports < ActiveRecord::Migration
  def change
    add_column :spree_inventory_sync_imports, :options, :text
  end
end
