class CategoriesController < ApplicationController
  before_action :correct_user

  def index
    @categories = Category.paginate(page: params[:page], :per_page => 10)
  end
  
  def show
    @category = Category.find(params[:id])
  end
  # /goods/new GET
  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
   
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
   
    if @category.update(category_params)
      redirect_to categories_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
 
    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category).permit(:category)
    end

    def correct_user
      redirect_to(root_url) unless user_signed_in?
    end
end
