class Cart
  #attr_reader :items

  #def initialize
  #  @item_ids = []
  #end

  def add_product(product)
    quantities_by_item_id[product.id] += 1
  end

  def items
   #Product.find(@item_ids)
   item_ids.map{|id| Product.find(id)}
  end

  def items_with_quantity
   quantities_by_item_id.map do |product_id, quantity|
     [Product.find(product_id), quantity]
   end
  end

  private
  def quantities_by_item_id
    @item_ids ||= []
    @quantities_by_item_id ||= Hash.new(0)
  end
end

