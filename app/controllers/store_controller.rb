class StoreController < ApplicationController
  def index
    @products = Product.for_sale.paginate :page => params[:page], :per_page => 4
  end

  def add_to_cart
    @product = Product.find(params[:id])
    @cart = current_cart
    @cart.add_product(@product)
  end

  def empty_cart
    session[:cart]=nil 
    redirect_to store_path, :notice => "買い物カゴは空です"
  end	

  private
  def current_cart
    session[:cart] ||= Cart.new
  end
end
