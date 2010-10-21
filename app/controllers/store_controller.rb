class StoreController < ApplicationController
  def index
    @products = Product.for_sale.paginate :page => params[:page], :per_page => 4
  end
end
