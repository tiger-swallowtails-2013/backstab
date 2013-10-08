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
  parent_id = params[:post][:parent_id].to_i
  if parent_id > 0
    parent = Post.find(params[:post][:parent_id])
    parent.comments << Post.create(params[:post])
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
    title = params[:post][:title]
    content = params[:post][:content]
    post = Post.find(params[:id])
    post.update_attributes(title: title, content: content)
    redirect_to post_path(post)
  end
end

