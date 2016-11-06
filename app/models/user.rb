class User < ActiveRecord::Base
  has_friendship
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
def self.search(search)
  if search
    where("nickname LIKE ? OR email LIKE?", "%#{search}%", "%#{search}%")
  else
    nil
  end
end

end
