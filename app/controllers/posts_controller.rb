class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def delete
     post= Post.find(params[:id])
     Post.destroy(post.id)
     redirect_to root_path
  end

  def create
    post = Post.create(params[:post])
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    p params
    post = Post.find(params[:id])
    post.update_attributes(params[:post])
    redirect_to root_path
  end
end

