class SearchController < ApplicationController
  def index
    @posts = Post.search(params[:search][:query], load: true).results
  end
end
