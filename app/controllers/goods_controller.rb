class GoodsController < ApplicationController
  filter_resource_access

  def index
    @goods = Good.page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.js {}
    end
  end
  
  def show
    @good = Good.find(params[:id])
  end
 
  def new
    @good = Good.new
    @categories = Category.all
  end

  def edit
    @good = Good.find(params[:id])
    @categories = Category.all
  end
   filter_resource_access
  def create
    @good = Good.new(good_params)

    if @good.save
      redirect_to goods_path
    else
      @categories = Category.all
      render 'new'
    end
  end

  def update
    @good = Good.find(params[:id])
   
    if @good.update(good_params)
      redirect_to goods_path
    else
      @categories = Category.all
      render 'edit'
    end
  end
  
  def destroy
    @good = Good.find(params[:id])
    @good.destroy
 
    redirect_to goods_path
  end

  private
    def good_params
      params.require(:good).permit(:name, :photo, :description, :category_id, 
                                   :price, :available)
    end
end
