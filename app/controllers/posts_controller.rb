class PostsController < ApplicationController
  before_action :authenticate_blogger!
  before_action :set_blogger, only: [:new, :create]
  before_action :set_post, only: [:show, :edit, :update]
  def show; end

  def new
    @post = @blogger.posts.new
  end

  def edit; end

  def create
    @post = @blogger.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: I18n.t('app.posts.created_post')
    else
      flash.now[:alert] = I18n.t('app.posts.cant_post')
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: I18n.t('app.posts.updated_post')
    else
      flash.now[:alert] = I18n.t('app.posts.cant_update')
      render :edit
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
