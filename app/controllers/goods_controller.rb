class GoodsController < ApplicationController
  before_action :correct_user

  def index
    @goods = Good.all
  end
  
  def show
    @good = Good.find(params[:id])
  end
  # /goods/new GET
  def new
    @good = Good.new
    @categories = Category.all
  end

  def edit
    @good = Good.find(params[:id])
    @categories = Category.all
  end

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

    def correct_user
      redirect_to(root_url) unless user_signed_in?
    end
end
