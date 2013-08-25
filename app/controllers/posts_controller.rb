class PostsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show]
  load_and_authorize_resource only: [:create, :update, :destroy]
  inherit_resources

  def index
    @posts = 
    if category.present?
      Post.ordered.by_category(category)
    elsif permitted_params[:tag].present?
      Post.tagged_with(permitted_params[:tag])
    else
      Post.ordered
    end
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @comment = Comment.new
    @post.visit_count.increment
  end

  def create
    @post = current_user.posts.new(permitted_params[:post]) 
    create!
  end

  protected
    def permitted_params
      params.permit!
    end

    def category
      Category.find(permitted_params[:category_id]) if permitted_params[:category_id].present?
    end

end
