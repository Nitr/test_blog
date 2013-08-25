class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :author, index: true

      t.timestamps
    end
  end
end
