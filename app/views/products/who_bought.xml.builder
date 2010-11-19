xml.order_list(:for_product => @product.name) do
  @orders.each do |order|
    xml.order do
      xml.name order.name
      xml.email order.email
    end
  end
end

