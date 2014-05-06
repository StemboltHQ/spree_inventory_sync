Spree::StockItem.class_eval do

  def count_on_hand_at(timestamp = Time.now)
      stock_movements = Spree::StockMovement.where(stock_item_id: self.id,
                                                   created_at: timestamp..Time.now)
      self.count_on_hand - stock_movements.sum(:quantity)
  end

end
