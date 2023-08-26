class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, User
    return unless user.present?

    can :read, Category
    can :manage, Category, user_id: user.id
    can :read, Payment
    can :manage, Payment, author_id: user.id
  end
end
