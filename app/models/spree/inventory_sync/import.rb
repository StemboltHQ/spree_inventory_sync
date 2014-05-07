class Spree::InventorySync::Import < ActiveRecord::Base
  has_many :stock_movements, as: :originator

  serialize :options

  def self.run_default!
    import = Spree::InventorySync::Import.create!(import_class: Spree::InventorySync.configuration.import_class, options: Spree::InventorySync.configuration.options)
    import.run!
    import
  end

  def run!
    import_class.constantize.new(options).inventory.each do |sku, count_on_hand|
      variant = Spree::Variant.find_by_sku(sku)
      if variant && count_on_hand != variant.total_on_hand
        variant.stock_locations.first.move variant, count_on_hand - variant.total_on_hand, self
      end
    end
  end
end
