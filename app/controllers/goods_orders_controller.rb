class GoodsOrdersController < ApplicationController
  filter_resource_access
  include CurrentCart

  def create
    if user_signed_in?
      set_cart
      good = Good.find_by(id: params[:good_id])

      @goods_orders = @cart.goods_orders.find_by(good_id: good.id)
      
      if @goods_orders
        @goods_orders.count += 1
      else
        @goods_orders = @cart.goods_orders.build(good_id: good.id,
                                     count: 1, price: params[:price])
      end

      if @goods_orders.save
        redirect_to  order_path(@goods_orders.order_id)
      else
        flash[:error] = "Could not add to cart."
        render :back
      end
    else
      flash[:error] = "You need sign in."
      redirect_to new_user_session_path
    end
  end

  def destroy
    set_cart
    @goods_orders = @cart.goods_orders.find(params[:id])
    @goods_orders.destroy
 
    redirect_to order_path(@cart.id)
  end
end
