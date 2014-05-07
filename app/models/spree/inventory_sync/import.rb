class Spree::InventorySync::Import < ActiveRecord::Base
  has_many :stock_movements, as: :originator

  serialize :options

  def run!
    import_class.constantize.new(options).inventory.each do |sku, count_on_hand|
      variant = Spree::Variant.find_by_sku(sku)
      if variant && count_on_hand != variant.total_on_hand
        variant.stock_locations.first.move variant, count_on_hand - variant.total_on_hand, self
      end
    end
  end
end
