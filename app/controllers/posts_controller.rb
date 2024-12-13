class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
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

  private
  def post_params
    params.require(:post).permit(:title, :body, :tags, :image)
  end
end