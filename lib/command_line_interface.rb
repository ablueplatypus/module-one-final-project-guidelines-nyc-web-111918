# interface for users to display what our app does
require "colorize"

def logo
a = Artii::Base.new :font => 'rowancap'
a.asciify('    GIF A CAT').colorize(:light_red)
end

def welcome
  puts "      ______________________________________________".colorize(:light_red)
  puts "  🐱 < Meow!! This is our super fun gif search app. >".colorize(:light_yellow)
  puts "      ----------------------------------------------".colorize(:light_red)
  sleep(1)
  puts "       You need an account to log in.".colorize(:light_red)
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
 puts "      _________________________________".colorize(:light_yellow)
 puts "  🐱 < Please choose one of the options.>".colorize(:light_yellow)
 puts "      ---------------------------------".colorize(:light_yellow)
end

def show_keywords
  puts "🐱 < Please enter one of these keywords:".colorize(:light_yellow)
end

def homepage_options
  sleep(0.5)
  puts "       1. View all of your favorite cat gifs".colorize(:light_blue)
  puts "       2. Search for a new cat gif".colorize(:light_blue)
end

def logout_options
  puts "       1. Do you want more cats?".colorize(:light_blue)
  puts "       2. Logout".green.blink
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
  current_user.gifs.map { |gif| "Title: #{gif.title} ~~~~~~~~ URL: #{gif.url}".colorize(:light_red) }
end

def user_has_no_favorites_url(current_user)
  get_users_favorites_url(current_user) == nil
end

def countdown_with_sleep(count)
  while count > 0
    count-=1
    sleep(1)
    puts "  🐱 < #{count+1}".colorize(:light_red)
  end
  puts "       MEOW!".colorize(:light_yellow)
end
