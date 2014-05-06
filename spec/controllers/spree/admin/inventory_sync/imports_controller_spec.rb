require 'spec_helper'

describe Spree::Admin::InventorySync::ImportsController do
  before do
    @routes = Spree::Core::Engine.routes
    controller.stub :current_spree_user => FactoryGirl.create(:admin_user)
  end

  let!(:import) { Spree::InventorySync::Import.create! }

  describe 'GET index' do
    it 'assigns @imports' do
      get :index
      expect(assigns[:imports]).to eq [import]
    end
  end

  describe 'GET show' do
    it 'assigns @import' do
      get :show, id: import.id
      expect(assigns[:import]).to eq import
    end
  end
end
