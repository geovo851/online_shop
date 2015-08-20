class OrdersController < ApplicationController
  filter_resource_access :attribute_check => true

  def index
    @orders = Order.page(params[:page]).per(10)
    
    respond_to do |format|
      format.html
      format.js {}
    end
  end
  
  def show
    @order = Order.find(params[:id])
  end
end
