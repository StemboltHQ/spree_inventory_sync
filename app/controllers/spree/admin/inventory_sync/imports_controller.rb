class Spree::Admin::InventorySync::ImportsController < Spree::Admin::BaseController
  respond_to :html

  def index
    @imports = Spree::InventorySync::Import.all
  end

  def show
    @import = Spree::InventorySync::Import.find(params[:id])
  end
end
