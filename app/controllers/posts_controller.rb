include ApplicationHelper

class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Post.new
  end

  def destroy
   post= Post.find(params[:id])
   post.destroy
   redirect_to root_path
 end

 def create
  if is_parent_post?
    parent = create_parent_post
    redirect_to post_path(parent)
  else
    post = Post.create(params[:post])
    redirect_to root_path
  end
end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = update_post
    redirect_to post_path(post)
  end
end

