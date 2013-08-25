FactoryGirl.define do
  factory :post do
    title "Post title"
    content "Post content"
    author { create :user }
    category_ids { [FactoryGirl.create(:category).id] }
    tag_list { "tag1, tag2" }
  end
end
