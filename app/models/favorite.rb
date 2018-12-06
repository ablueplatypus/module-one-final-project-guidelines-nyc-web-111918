# Favorite class belongs to a user and a gif
class Favorite < ActiveRecord::Base

  belongs_to :user
  belongs_to :gif

# [x] Favorite's gif_id has to match the gif's id
# [x] Whatever gets matched up, gets returned
# [ ] iterate through the returned gifs and return just the urls
# push them into a new array
  # 
  # def user_favorite_urls
  #   # match up gif_id to the favorites method
  #   favorites.map do |favorite|
  #     favorite.find_by()
  #   # and map out urls for the current user
  #
  # end

end # end of Favorite class
