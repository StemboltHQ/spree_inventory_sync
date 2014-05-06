Spree::StockMovement.class_eval do
  def variant
    stock_item.variant
  end

  def sku
    variant.sku
  end

  def product
    variant.product
  end
end
