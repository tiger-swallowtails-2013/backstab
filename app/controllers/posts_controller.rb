class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
    @has_parent = false
  end

  def show
    @post = Post.find(params[:id])
    @comment = Post.new
    @has_parent = true
  end

  def destroy
   post= Post.find(params[:id])
   post.destroy
   redirect_to root_path
 end

 def create
  title = params[:post][:title]
  content = params[:post][:content]
  parent_id = params[:post][:parent_id].to_i
  if params[:post][:has_parent] && parent_id > 0
    parent = Post.find(params[:post][:parent_id])
    parent.comments << Post.create(title: title, content: content, parent_id: parent_id)
    redirect_to post_path(parent)
  else
    post = Post.create(title: title, content: content, parent_id: parent_id)
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

