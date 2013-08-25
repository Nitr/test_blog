module CategoriesHelper
  def tree_categories category
    ctx = li_category(category)

    if category.has_children?
      ctx += content_tag :ul do
        ul_ctx = ""
        category.children.order("id ASC").each do |c|
          ul_ctx += tree_categories(c).html_safe
        end
        ul_ctx.html_safe
      end
    end
    ctx
  end

  def li_category category
    content_tag :li do
      link_to category.name, posts_path(category_id: category.id)
    end
  end

end
