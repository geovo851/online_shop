class GoodsOrdersController < ApplicationController
  include CurrentCart

  def create
    if user_signed_in?
      set_cart
      good = Good.find_by(id: params[:good_id])
      @goods_orders = @cart.goods_orders.build(good_id: good.id,
                                             count: 1, price: params[:price])

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
    @goods_order = GoodsOrder.find(params[:id])
    @goods_order.destroy

    set_cart
    redirect_to order_path(@cart.id)
  end
end
