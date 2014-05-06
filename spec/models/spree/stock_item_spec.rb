require 'spec_helper'

describe Spree::StockItem do
  describe '#count_on_hand_at' do

    let(:product) { create(:product) }
    let(:stock_item) {
      product.master.stock_items.first.adjust_count_on_hand(10)
      product.master.stock_items.first
    }

    before(:each) do
      create(:stock_movement, stock_item: stock_item, quantity: 10, created_at: 1.hour.ago) 
      create(:stock_movement, stock_item: stock_item, quantity: -5, created_at: 1.hour.ago) 
    end

    context 'when there were stock movements since timestamp' do
      let(:timestamp) { 2.hours.ago }
      it 'calculates count on hand at given point' do
        expect(stock_item.count_on_hand).to eql(15)
        expect(stock_item.count_on_hand_at(timestamp)).to eql(10)
      end
    end

    context 'when there were no stock movements since timestamp' do
      let(:timestamp) { 10.minutes.ago }
      it 'returns the same as count_on_hand' do
        expect(stock_item.count_on_hand_at(timestamp)).to eql(stock_item.count_on_hand)
      end
    end
  end

end
