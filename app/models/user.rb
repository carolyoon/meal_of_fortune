class User < ActiveRecord::Base
  has_many :favorites
  has_many :favorited_restaurants, through: :favorites, source: 'restaurant'

  include BCrypt 

  validates :username, presence: true, uniqueness: true

  def password
    @password = Password.create(new_password)
  end 

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end 

  def self.authenticate(username, password)
    @user= User.find_by(username: username)
    if @user && @user.password == password
      @user
    else
      nil
    end 
  end 
end

