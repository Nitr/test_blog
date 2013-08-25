class Comment < ActiveRecord::Base
  belongs_to :post, touch: true
  belongs_to :author, class_name: "User", foreign_key: :author_id
  validates :author_id, :post_id, :content, presence: true
end
