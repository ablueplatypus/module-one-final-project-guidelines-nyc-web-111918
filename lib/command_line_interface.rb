# interface for users to display what our app does

def welcome
  puts "🐱 < Meow!! This is our super fun gif search app."
  puts "     You need an account to log in."
end

def find_or_create_user(name, birthday) # name = login_name
  User.find_or_create_by(name: name, username: "Trill#{name}", birthday: birthday)
end

def user_input
  gets.chomp.strip
end

def user_input_upcase
  gets.chomp.upcase.strip
end

# def show_keywords
#   puts "Please enter one of these keywords:"
# end


def list_of_keywords
  #key word list from api.
  keywords_updated
  #binding.pry
end
# binding.pry

def puts_keywords
  puts keywords_updated.sample(15)
end

# def print_key_word_list
#   list_of_keywords.map { |keyword| p keyword }
# end

def find_keyword_in_titles(keyword)
  url_array = []
  get_title_url_from_api.select do |title, url|
    url_array << url if title.include?(keyword)
  end
  url_array
  # binding.pry
end

def return_random_gif_url(keyword)
  find_keyword_in_titles(keyword).sample
end

def create_new_gif(keyword, url)
  Gif.create(title: keyword, url: url)
end

def get_current_user(name, birthday)
  User.find_by(name: name, birthday: birthday)
end

def create_favorite(current_user, new_gif)
  Favorite.create(user_id: current_user.id, gif_id: new_gif.id)
end

def countdown_with_sleep(count)
  while count > 0
    count-=1
    sleep(1)
    puts "🐱  #{count+1}"
  end
  puts "HAPPY NEW YEAR!"
end
