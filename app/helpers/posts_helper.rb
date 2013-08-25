module PostsHelper
  def slice_html env, method_name, length=150
    HtmlSlicer::Interface.new(env, method_name, {:slice => {:maximum => length}}) #.html_safe
  end
end
