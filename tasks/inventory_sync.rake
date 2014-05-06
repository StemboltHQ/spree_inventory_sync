namespace :inventory do
  task :sync => :environment do |t, args|
    result = Spree::InventorySync::Import.run
    puts result.join("\n")
  end
end
