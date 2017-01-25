class PostsController < ApplicationController
  # before_action :set_post, only: [:show, :edit, :update, :destroy]
  def show

  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path
    else
      redirect_to root_path, notice: @post.errors.full_messages.first
    end
  end

  def edit
  end

  def update
  end

  def update
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :attachment)
  end
end
