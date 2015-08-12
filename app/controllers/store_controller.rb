class StoreController < ApplicationController
  def index
    @goods = Good.paginate(page: params[:page], :per_page => 10)
  end
  
  def show
    @good = Good.find(params[:id])
  end
end
