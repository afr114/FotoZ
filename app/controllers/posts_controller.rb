class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end


  def edit
  end

  def update
  end

  def destory
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
