require_relative '../config/environment'
require "artii"
require "colorize"

#---------------LOGIN SECTION---------------
system("clear")
puts "                                         "
puts logo
sleep(1)
welcome
puts "                                         "
sleep(1)
puts "       Please enter your name.".colorize(:cyan)
name = user_input
system("clear")
sleep(0.5)
puts "                                         "
puts "  🐱 < Please enter your birthday to log in (yyyy-mm-dd).".colorize(:cyan)
birthday = user_input
# checks if user exists
if find_or_create_user(name, birthday) == User.find_by(name: name, birthday: birthday)
  system("clear")
  sleep(0.5)
  puts "                                         "
  puts logo
  puts "                                         "
  puts "  😸 < Welcome Trill#{name}!".colorize(:magenta)
  puts "                                         "
else
  puts "Your account has been created! We chose a username for you! Your username is Trill#{name}.".colorize(:magenta)
end

current_user = User.find_by(name: name, birthday: birthday)

#-------------RUNNING APP SECTION -----------------#
leave = nil #this is False because nil is false
until leave == true
#until the user asks to logout keep asking if they want to search
right_keyword = nil
until right_keyword == true

ask_fav = nil
until ask_fav == true
  sleep(1)
  puts "                                         "
  puts "  🐱 < Please type one of the numbers to choose one of the options.".colorize(:cyan)
  homepage_options
  options_input = user_input
  current_user = User.find_by(name: name, birthday: birthday)
  if options_input == "1"
    if get_users_favorites_url(current_user).empty?
      puts "😿 < Sorry. You have no saved favorites.".colorize(:magenta)
    else
      puts get_users_favorites_url(current_user)
    end
  else
  end
  if options_input == "2"
    ask_fav = true
  end
end # end of homepage_options until

  system("clear")
  show_keywords
  puts_keywords
  keyword = user_input
  system("clear")
  if list_of_keywords.include?(keyword) == false
    system("clear")
    puts "     Ummm... That is not a keyword, please enter a valid keyword.".colorize(:magenta)
  else
    find_keyword_in_titles(keyword)
    url = return_random_gif_url(keyword)
    system("clear")
    puts keyword
    new_gif = create_new_gif(keyword, url)
    p url
    sleep(1)
    puts "                                         "
    puts "Are you ready to see a TRILL GIF?!?!!".colorize(:magenta)
    countdown_with_sleep(3)
    sleep(1)
    system('open', url)
    right_keyword = true
  end
end # end of until wrong_keyword

system("clear")
# save favorites
save_this_gif = puts "Do you want to save this gif as a favorite? Y/N".colorize(:cyan)
yes_no = user_input_upcase
# answer = user_input
  if yes_no == "N"
    system("clear")
    puts "O.K. This gif was not saved.".colorize(:magenta)
  else yes_no == "Y"
    create_favorite(current_user, new_gif)
    # binding.pry
    system("clear")
    puts "You have saved this gif to your favorites!".colorize(:magenta)
  end
  # Do you want to see your favorites????
  system("clear")
  puts "Do you want to see all of your saved favorites? Y/N".colorize(:cyan)
  if user_input_upcase == "Y"
    puts get_users_favorites_url(current_user)
  end

  #--------------LOGOUT SECTION---------------------

  # puts "pretty spaces +++++++++++++++++++++++++++++++++="
  options_puts
  logout_options
  answer = user_input
  if answer == "2" || answer.downcase == "logout" || answer.downcase == "exit"
    leave = true
  end
end # end of until leave

# puts "Do you want logout? Y/N"
#if they say Y, the app exits.
#if they say N, the app ask them to search a keyword.
system("clear")
puts logo
puts "                                         "
puts "   👋🐱 < See you later! MEOW, MEOW!".colorize(:magenta)
puts "                                         "
