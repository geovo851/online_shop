class StoreController < ApplicationController
  include CurrentCart

  def index
    @goods = Good.page(params[:page]).per(10)
   
    if user_signed_in?
      set_cart
      @count_in_cart = @cart.goods_orders.count
    end

    respond_to do |format|
      format.html
      format.js {}
    end
  end
  
  def show
    @good = Good.find(params[:id])
    if user_signed_in?
      set_cart
      @count_in_cart = @cart.goods_orders.count
    end
  end
end
