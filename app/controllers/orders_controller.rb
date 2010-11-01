class OrdersController < ApplicationController
  def index
    @orders = Order.order(:created_at).reverse_order
  end

end
