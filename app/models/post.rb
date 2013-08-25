class Post < ActiveRecord::Base
  include Searchable
  extend FriendlyId
  include Redis::Objects
  friendly_id :title, use: [:slugged, :finders]
  counter :visit_count
  acts_as_taggable

  scope :by_category, ->(category){joins(:categories).where("categories.id in (?)", category.subtree_ids)}
  scope :ordered, ->{order("created_at DESC")}
  
  belongs_to :author, class_name: "User", foreign_key: :author_id
  has_and_belongs_to_many :categories
  has_many :comments
  
  validates :author_id, :title, :content, :category_ids, presence: true
  validates :title, length: {maximum: 255}

end
