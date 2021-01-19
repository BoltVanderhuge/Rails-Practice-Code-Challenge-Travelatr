class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :like]
  def index
    @posts = Post.all
  end

  def edit
  end

  def update
    @post.update(post_params(:title,:content, :blogger_id, :destination_id))
    redirect_to post_path(@post)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    new_post = Post.create(post_params(:title,:content, :blogger_id, :destination_id, :likes))
    if new_post.valid?
      redirect_to post_path(new_post)
    else
      redirect_to new_post_path
    end

  end
  
  def like
    Post.increment_counter(:likes, params[:id])
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params(*args)
    params.require(:post).permit(*args)
  end

end
