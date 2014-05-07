SpreeInventorySync
===================

SpreeInventorySync provides functionality for importing inventory status from an external inventory system

More information can be found on the [wiki](https://github.com/freerunningtech/spree_inventory_sync/wiki)


Installation
------------

Add spree_inventory_sync to your Gemfile:

```rubygem
gem 'spree_inventory_sync', github: 'freerunningtech/spree_inventory_sync'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_inventory_sync:install
```

Configure your inventory sync by doing the following in your application:

In ``config/initializers/spree_inventory_sync.rb`

```ruby
Spree::InventorySync.configure do |config|
  config.import_class = "" # A string containing the class to use for importing (i.e. Spree::InventorySync::Source::CoreWarhouse)
  config.options      = {} # A hash contianing options to be passed to the source
end
```

Support
-------

The following back ends are currently supported:

- Core Warehouse


Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_inventory_sync/factories'
```

Copyright (c) 2014 FreeRunning Technologies, released under the New BSD License
