class HomeController < ApplicationController
  def index
    @posts = Post.where.not(status: :deleted).order(created_at: :desc).page(params[:page]).per(3)
  end
end
