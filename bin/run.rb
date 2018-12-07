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
system("say", "Welcome to Gif A Cat")
# sleep(1)
puts "Please enter your name.".light_blue.blink
system("say", "Please enter your name.")
#------NAME INPUT EDGE CASE---------------
# name = user_input_downcase
need_a_name = true
while need_a_name == true
  name = user_input_downcase
  if name.length < 2
    puts "Oops... Please try again!".colorize(:red)
    puts "Your name must be longer than 2 characters.".colorize(:red)
    system("say", "oops")
  elsif name.length > 2
  need_a_name = false
  end
end # end of while loop

system("clear")
sleep(0.5)
puts "                                         "
puts "      __________________________________________________".colorize(:light_yellow)
puts "  🐱 < Please enter your birthday to log in (yyyy-mm-dd).>".colorize(:light_yellow)
puts "      --------------------------------------------------".colorize(:light_yellow)
birthday = user_input
# checks if user exists
if find_or_create_user(name, birthday) == User.find_by(name: name, birthday: birthday)
  system("clear")
  sleep(0.5)
  puts "                                         "
  puts logo
  puts "                                         "
  puts "      _____________________".colorize(:light_yellow)
  puts "  😸 < Welcome Trill#{name}!>".colorize(:light_yellow)
  puts "      ---------------------".colorize(:light_yellow)
  puts "                                         "
  system("say", "Hi Trill#{name}!")
else
  puts "Your account has been created! We chose a username for you! Your username is Trill#{name}.".colorize(:light_yellow)
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
  puts "      ____________________________________________________________".colorize(:light_yellow)
  puts "  🐱 < Please type one of the numbers to choose one of the options.>".colorize(:light_yellow)
  puts "      ------------------------------------------------------------".colorize(:light_yellow)
  puts "                                         "
  homepage_options
  options_input = user_input
  current_user = User.find_by(name: name, birthday: birthday)
  if options_input == "1"
    if get_users_favorites_url(current_user).empty?
      puts "😿 < Sorry. You have no saved favorites.".colorize(:light_yellow)
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
    puts "     Ummm... That is not a keyword, please enter a valid keyword.".colorize(:light_yellow)
  else
    find_keyword_in_titles(keyword)
    url = return_random_gif_url(keyword)
    system("clear")
    puts "  🐱 < You searched for #{keyword}".colorize(:light_red)

    new_gif = create_new_gif(keyword, url)
    p url
    sleep(1)
    puts "                                         "
    puts "       Are you ready to see a TRILL GIF?!?!!".colorize(:light_yellow)
    countdown_with_sleep(3)
    system("say", "Meeee ow")
    sleep(1)
    system('open', url)
    right_keyword = true
  end
end # end of until wrong_keyword

system("clear")
# save favorites
save_this_gif = puts "  🐱 < Do you want to save this gif as a favorite? Y/N".colorize(:light_yellow)
yes_no = user_input_upcase
# answer = user_input
  if yes_no == "N"
    system("clear")
    puts "       O.K. This gif was not saved.".colorize(:light_yellow)
  else yes_no == "Y"
    create_favorite(current_user, new_gif)
    # binding.pry
    system("clear")
    puts "       You have saved this gif to your favorites!".colorize(:light_yellow)
  end
  # system("clear")
  puts "      _____________________________________________________".colorize(:light_yellow)
  puts "  🐱 < Do you want to see all of your saved favorites? Y/N >".colorize(:light_yellow)
  puts "      -----------------------------------------------------".colorize(:light_yellow)
  if user_input_upcase == "Y"
    puts get_users_favorites_url(current_user)
  end

  # puts "  🐱 < Do you want to see all of your saved favorites? Y/N".colorize(:light_yellow)
  # yes_no_2 = user_input_upcase
  #   if yes_no_2 == "Y"
  #     current_user = User.find_by(name: name, birthday: birthday)
  #     get_users_favorites_url(current_user).empty?
  #     puts "  😿 < Sorry. You have no saved favorites.".colorize(:light_yellow)
  #   else
  #   end

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
puts "   👋🐱 < See you later! MEOW, MEOW!".colorize(:light_yellow)
puts "                                         "
system("say", "See you later! MEEE OW!")
