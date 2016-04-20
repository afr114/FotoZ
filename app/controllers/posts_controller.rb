class PostsController < ApplicationController

  def index
    @posts = current_user.posts.all
    @user = User.find(@posts.first.user_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      flash[:alert] = "Halt, you fiend! You need an image to post here!"
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
      flash[:success] = "Post updated hombre."
    else
      flash[:alert] = "Error updating post"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to posts_path
    flash[:success] = "Problem solved!  Post deleted."
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
