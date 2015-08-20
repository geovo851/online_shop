class CategoriesController < ApplicationController
  filter_resource_access
  
  def index
    @categories = Category.page(params[:page]).per(10)
    
    respond_to do |format|
      format.html
      format.js {}
    end
  end
  
  def show
    @category = Category.find(params[:id])
  end

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
end
