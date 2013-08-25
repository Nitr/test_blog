class CommentsController < ApplicationController
  inherit_resources
  belongs_to :post

  def update
    update!{post_path(@post)}
  end

  def create 
    @post = Post.find(permitted_params[:post_id])
    @comment = @post.comments.new(permitted_params[:comment])
    @comment.author_id = current_user.id
    create!{post_path(@post)}
  end

  def destroy
    destroy!{post_path(@post)}
  end

  protected
    def permitted_params
      params.permit!
    end

end
