class StoreController < ApplicationController
  filter_access_to :all
  include CurrentCart
  
  def index
    @goods = Good.page(params[:page]).per(10)
    @categories = Category.all

    count_in_cart

    respond_to do |format|
      format.html
      format.js {}
    end
  end
  
  def show
    @good = Good.find(params[:id])
    @categories = Category.all
    count_in_cart
  end

  def search_goods
    @goods = Good.where(category_id: params[:id]).page(params[:page]).per(10)

    @categories = Category.all
    @category_id = "category_#{params[:id]}"
    
    count_in_cart
    
    respond_to do |format|
      format.html
      format.js {}
    end
  end

  def delivery
    @categories = Category.all
    count_in_cart
  end

  def guarantee
    @categories = Category.all
    count_in_cart
  end

  def contact
    @categories = Category.all
    count_in_cart
  end

  private

    def count_in_cart
      if user_signed_in?
        set_cart
        @count_in_cart = @cart.goods_orders.count
      end
    end
end
