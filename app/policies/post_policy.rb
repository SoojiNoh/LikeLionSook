class PostPolicy < ApplicationPolicy
  attr_reader :user, :post
  
    def initialize(user, post)
      @user = user
      @post = post
    end
  
    def update?
      user.authority (post)
    end
    
    def destroy?
      user.authority (post)
    end
    
    
end

