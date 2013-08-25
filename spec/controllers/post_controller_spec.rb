require "spec_helper"

describe PostsController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "all post" do
      post1, post2 = FactoryGirl.create(:post), FactoryGirl.create(:post)
      get :index

      expect(assigns(:posts)).to match_array([post1, post2])
    end

    it "posts by category" do
      category = FactoryGirl.create(:category)
      post1, post2 = FactoryGirl.create(:post, categories: [category]), FactoryGirl.create(:post, categories: [category])
      get :index, category_id: category.id

      expect(assigns(:posts)).to match_array([post1, post2])
    end

    it "posts by category" do
      post1, post2 = FactoryGirl.create(:post), FactoryGirl.create(:post)
      tag = post1.tags.first
      get :index, tag: tag.name

      expect(assigns(:posts)).to match_array([post1, post2])
    end

  end
end
 
