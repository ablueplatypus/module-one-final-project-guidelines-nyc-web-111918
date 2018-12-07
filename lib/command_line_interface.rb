# interface for users to display what our app does
require "colorize"

def welcome
  puts "🐱 < Meow!! This is our super fun gif search app.".colorize(:magenta)
  puts "     GIF A CAT".colorize(:magenta)
  puts "     You need an account to log in.".colorize(:magenta)
end

def find_or_create_user(name, birthday) # name = login_name
  User.find_or_create_by(name: name, username: "Trill#{name}", birthday: birthday)
end

def user_input
  gets.chomp.strip
end

def user_input_downcase
  gets.chomp.downcase.strip
end

def user_input_upcase
  gets.chomp.upcase.strip
end

def options_puts
 puts "🐱 < Please choose one of the options."
end

def show_keywords
  puts "Please enter one of these keywords:".colorize(:cyan)
end

def homepage_options
  puts "1. View all of your favorite cat gifs".colorize(:cyan)
  puts "2. Search for a new cat gif".colorize(:cyan)
end

def logout_options
  puts "1. Do you want more cats?"
  puts "2. Logout"
end

def list_of_keywords
  #key word list from api.
  keywords_updated
  #binding.pry
end
# binding.pry

def puts_keywords
  puts keywords_updated.sample(15)
end

#for debugging print respone to the api.

def find_keyword_in_titles(keyword)
  url_array = []
  downcase_title_url_keys.select do |title, url|
    url_array << url if title.include?(keyword)
  end
  url_array
end

def return_random_gif_url(keyword)
  find_keyword_in_titles(keyword).sample
end

def create_new_gif(keyword, url)
  #loop over our Hash
  #the hash keyword will equal the keyword
  #the url will equal the url
  Gif.create(title: keyword, url: url)
end

def get_current_user(name, birthday)
  User.find_by(name: name, birthday: birthday)
end

def create_favorite(current_user, new_gif)
  Favorite.create(user_id: current_user.id, gif_id: new_gif.id)
end

def get_users_favorites_url(current_user)
  current_user.gifs.map { |gif| "Title: #{gif.title} ~~~~~~~~ URL: #{gif.url}".colorize(:magenta) }
end

def user_has_no_favorites_url(current_user)
  get_users_favorites_url(current_user) == nil
end

def countdown_with_sleep(count)
  while count > 0
    count-=1
    sleep(1)
    puts "🐱  #{count+1}".colorize(:magenta)
  end
  puts "MEOW!".colorize(:magenta)
end
