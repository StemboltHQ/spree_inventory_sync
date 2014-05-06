class CreateSpreeInventorySyncImports < ActiveRecord::Migration
  def change
    create_table :spree_inventory_sync_imports do |t|
      t.datetime :message_date

      t.timestamps
    end
  end
end
