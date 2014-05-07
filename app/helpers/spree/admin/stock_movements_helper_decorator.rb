Spree::Admin::StockMovementsHelper.module_eval do
  # This is mostly taken from spree's helper
  def pretty_originator(stock_movement)
    if stock_movement.originator.respond_to?(:number)
      if stock_movement.originator.respond_to?(:order)
        link_to stock_movement.originator.number, [:edit, :admin, stock_movement.originator.order]
      else
        stock_movement.originator.number
      end
    # BEGIN Modified Code
    elsif stock_movement.originator.is_a? Spree::InventorySync::Import
      link_to stock_movement.originator.created_at, spree.admin_inventory_sync_import_path(stock_movement.originator)
    # END Modified Code
    else
      ""
    end
  end
end
