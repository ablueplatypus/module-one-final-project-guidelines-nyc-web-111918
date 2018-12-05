# User class has many favorites, and many gifs through favorites
class User < ActiveRecord::Base

  has_many :favorites
  has_many :gifs, through: :favorites


end # end of User class
