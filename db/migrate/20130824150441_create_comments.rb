class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post, index: true
      t.references :author, index: true
      t.text :content

      t.timestamps
    end
  end
end
