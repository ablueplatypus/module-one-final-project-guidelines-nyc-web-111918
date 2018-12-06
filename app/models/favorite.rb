# Favorite class belongs to a user and a gif
class Favorite < ActiveRecord::Base

  belongs_to :user
  belongs_to :gif



end # end of Favorite class
