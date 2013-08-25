class CreatePostsCategories < ActiveRecord::Migration
  def change
    create_table :categories_posts, id: false do |t|
      t.references :post, index: true, null: false
      t.references :category, index: true, null: false
    end
     add_index :categories_posts, [:post_id, :category_id]
  end
end
