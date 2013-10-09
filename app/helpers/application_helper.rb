module ApplicationHelper

  def is_parent_post?
    (params[:post][:parent_id]).to_i > 0
  end

  def create_parent_post
    parent = Post.find(params[:post][:parent_id])
    parent.comments << Post.create(params[:post])
    parent
  end

  def update_post
    title = params[:post][:title]
    content = params[:post][:content]
    post = Post.find(params[:id])
    post.update_attributes(title: title, content: content)
    post
  end

  def not_signed_in?
    false
  end
end
