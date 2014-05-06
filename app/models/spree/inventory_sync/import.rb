require 'nori'

class Spree::InventorySync::Import < ActiveRecord::Base
  has_many :stock_movements, as: :originator

  def run
  end
end
