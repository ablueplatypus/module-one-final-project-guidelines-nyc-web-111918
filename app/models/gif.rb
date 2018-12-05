# Gif class has many favorites, and many gifs through favorites
class Gif < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites


end # end of Gif class
