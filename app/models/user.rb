class User < ActiveRecord::Base
  has_many :tweets
  has_secure_password
  validates :username, presence: true, uniqueness: { message: "%{value} is already in use.  Please select another or login."}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, presence: true, uniqueness: { message: "%{value} is already in use.  Please select another or login."}

  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end
  
end
