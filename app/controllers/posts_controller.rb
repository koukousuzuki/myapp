class PostsController < ApplicationController
  
  before_action :authenticate_user!,:only =>[:new, :create, :edit, :destroy, :update]
  
  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params.require(:post).permit(:content, :place, :user_id).merge(:user_id => current_user.id))
    @user = User.find(@post.user_id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params.require(:post).permit(:content, :place))
    @user = User.find(@post.user_id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @user = User.find(@post.user_id)
  end
end
