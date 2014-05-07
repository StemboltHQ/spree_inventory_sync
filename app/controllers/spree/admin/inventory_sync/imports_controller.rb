class Spree::Admin::InventorySync::ImportsController < Spree::Admin::BaseController
  respond_to :html

  def index
    @imports = Spree::InventorySync::Import.all
  end

  def show
    @import = Spree::InventorySync::Import.find(params[:id])
  end

  def create
    import = Spree::InventorySync::Import.create!(import_class: Spree::InventorySync.configuration.import_class, options: Spree::InventorySync.configuration.options)
    import.run!
    redirect_to admin_inventory_sync_import_path(import)
  end
end
