class AdminsController < ApplicationController
  before_action :correct_user

  def index
  end

  private
    def correct_user
      redirect_to(root_url) unless user_signed_in?
    end
end
