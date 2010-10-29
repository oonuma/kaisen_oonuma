class StoreController < ApplicationController
  before_filter :set_cart
  
  def index
    @products = Product.for_sale.paginate :page => params[:page], :per_page => 4
  end

  def add_to_cart
    @product = Product.find(params[:id])
    @cart.add_product(@product)
    #redirect_to store_path, :notice => "#{@product.name}が買い物カゴに追加されました"
    respond_to do |format|
      format.js
    end
  end

  def remove_item_from_cart
    product = Product.find(params[:id])
    @cart.remove_product(product)

    #redirect_to store_path, notice => "#{product.name}を買い物かごから削除しました"
    respond_to do |format|
      format.js
    end
  end

  def empty_cart
    session[:cart]=nil 
    #redirect_to store_path, :notice => "買い物カゴは空です"
    respond_to do |format|
      format.js
    end
  end	

  private
  def set_cart
    @cart = session[:cart] ||= Cart.new
  end
end
