class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :create, Post
      can :manage, Post, author_id: user.id

      can :create, Comment
      can :manage, Comment, author_id: user.id
      can :manage, Comment, post: {author_id: user.id}
    end
  end
end
