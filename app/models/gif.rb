# Gif class has many favorites, and many gifs through favorites
class Gif < ActiveRecord::Base

  has_many :favorites
  has_many :users, through: :favorites

  # def user_favorite_urls
  #   # match up gif_id to the favorites method
  #   favorites.map do |favorite|
  #     favorite.find_by()
  #   # and map out urls for the current user
  #
  # end

end # end of Gif class
