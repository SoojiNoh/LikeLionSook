class User < ActiveRecord::Base
  has_friendship
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         
         
  # user : post = 1 : n
  has_many :posts
         
         
         
         
def self.search(search)
  if search
    where("nickname LIKE ? OR email LIKE?", "%#{search}%", "%#{search}%")
  else
    nil
  end
end

  
  def authority (post)
    if self == post.user
      true
    end
  end
  
  
  def read_authority (post)
    if post.scope == 1 && post.user == self
        true
      elsif post.scope == 2 && post.user.friends_with?(self) || post.user == self
        true
      elsif post.scope ==3
        true
      else
        false
    end
  end  
end
