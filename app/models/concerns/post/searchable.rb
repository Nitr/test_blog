class Post
  module Searchable
    extend ActiveSupport::Concern
    included do
      include Tire::Model::Search
      include Tire::Model::Callbacks

      mapping do
        indexes :title,        :analyzer => 'snowball', :boost => 100
        indexes :content,      :analyzer => 'snowball'
      end
    end

  end
end
