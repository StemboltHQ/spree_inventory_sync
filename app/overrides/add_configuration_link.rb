Deface::Override.new(
  virtual_path: "spree/admin/shared/_configuration_menu",
  name: "add-configuration-menu_link",
  insert_bottom: "[data-hook='admin_configurations_sidebar_menu']",
  partial: "spree/admin/configuration/inventory_sync",
)
