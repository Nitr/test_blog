class CategoriesController < ApplicationController
  inherit_resources

  def update
    update!{categories_path}
  end

  def create
    create!{categories_path}
  end

  protected
    def permitted_params
      params.permit!
    end


end
