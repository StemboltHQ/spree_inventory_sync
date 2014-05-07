module Spree::InventorySync
  class << self
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def table_name_prefix
      'spree_inventory_sync_'
    end
  end

  class Configuration
    attr_accessor :import_class
    attr_accessor :options
  end
end
