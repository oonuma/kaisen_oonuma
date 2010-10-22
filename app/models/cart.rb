class Cart
  #attr_reader :items

  def initialize
    @item_ids = []
  end

  def add_product(product)
    @item_ids << product.id
  end

  def items
   #Product.find(@item_ids)
   item_ids.map{|id| Product.find(id)}
  end

  private
  def item_ids
    @item_ids ||= []
  end
end

