class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_post, only: %i[destroy]
  def index
    @posts = Post.all

    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
    
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to user_path(current_user)
  end
  private
  def post_params
    params.require(:post).permit(:title, :body, :tags, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end