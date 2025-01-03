class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
  end
end
