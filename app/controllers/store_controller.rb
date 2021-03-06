class StoreController < ApplicationController
  before_filter :set_cart
  
  def index
#    @hot_selling_products = Product.limit(3)
    @hot_selling_products = LineItem.count(:group => :product_id).sort_by{|id, count| -count }[0,3].map{|id, count| Product.find(id)}
    @recent_products = Product.recent(3)
    @products = Product.for_sale.paginate :page => params[:page], :per_page => 4
  end

  
  def checkout
    if @cart.nil? || @cart.items.empty?
      redirect_to store_path, :notice => "カートは現在、空です"
    end
  end

  def save_order
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart)
    if @order.save
      @cart.empty!
      Notifier.ordered(@order).deliver
      redirect_to store_path, :notice => "ご注文ありがとうございます!!"
    else
      render checkout_path
    end
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

  def suppliers
    @suppliers = Shop.all
  end	
  private
  def set_cart
    @cart = session[:cart] ||= Cart.new
  end
end
