class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  #validates_associated :product
  validates_presence_of :product_id
  validates_numericality_of :quantity, :greater_than => 0, :only_integer => true

  def self.from_cart_item(cart_item)
    line_item = self.new
    line_item.product_id = cart_item.product_id
    line_item.quantity = cart_item.quantity
    line_item
  end
end
