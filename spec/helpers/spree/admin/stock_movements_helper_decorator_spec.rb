require 'spec_helper'

describe Spree::Admin::StockMovementsHelper do
  before do
    @routes = Spree::Core::Engine.routes
  end

  describe '.pretty_originator' do
    let(:stock_movement) { stub_model Spree::StockMovement, originator: originator }
    subject { helper.pretty_originator(stock_movement) }

    context 'when stock_movement is a Spree::InventorySync::Import' do
      let(:originator) { stub_model Spree::InventorySync::Import, model_name: 'Bar', to_param: '1233' }

      it 'returns a link to the import' do
        expect(subject).to eq "<a href=\"/admin/inventory_sync/imports/1233\">1985-10-26 00:00:00 UTC</a>"
      end
    end
  end
end
