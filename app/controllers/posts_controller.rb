class PostsController < ApplicationController
  before_action :authenticate_blogger!
  before_action :set_blogger, only: [:new, :create]
  before_action :set_post, only: [:show]
  def show; end

  def new
    @post = Post.new(blogger: @blogger)
  end

  def create
    @post = Post.new(post_params)
    @post.blogger = @blogger
    if @post.save
      redirect_to post_path(@post), notice: I18n.t('app.posts.created_post')
    else
      flash.now[:notice] = I18n.t('post.cant_post')
      render 'new'
    end
  end

  private

  def set_blogger
    @blogger = current_blogger
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:text)
  end
end
