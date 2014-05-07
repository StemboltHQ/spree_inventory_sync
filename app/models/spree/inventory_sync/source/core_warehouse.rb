require 'savon'

class Spree::InventorySync::Source::CoreWarehouse

  def initialize(options = {})
    @owner = options[:owner]
  end

  def inventory
    Hash[item_detail.map{ |item| [item[:item_code][1..-1], item[:available].to_i] }]
  end

  private
  def soap_client
    @client ||= Savon.client(wsdl: 'http://gateway.coreebusiness.com/admin/code/soap/CoreWS.asmx?WSDL')
  end

  def item_detail
    response = soap_client.call(:get_inventory_status, message: { "InventoryStatus" => { "Items" => { "InventoryStatusRequestItem" => { "Owner" => @owner } } }})
    response.to_hash[:get_inventory_status_response][:get_inventory_status_result][:items][:inventory_status_reply_item]
  end
end
