class RemoveMessageDateFromSpreeInventorySyncImports < ActiveRecord::Migration
  def up
    remove_column :spree_inventory_sync_imports, :message_date
  end

  def down
    add_column :spree_inventory_sync_imports, :message_date, :datetime
  end
end
