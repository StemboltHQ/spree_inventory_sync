class Spree::Admin::InventorySync::ImportsController < Spree::Admin::BaseController
  respond_to :html

  def index
    @imports = Spree::InventorySync::Import.all
  end

  def show
    @import = Spree::InventorySync::Import.find(params[:id])
  end

  def create
    import = Spree::InventorySync::Import.run_default!
    redirect_to admin_inventory_sync_import_path(import)
  end
end
