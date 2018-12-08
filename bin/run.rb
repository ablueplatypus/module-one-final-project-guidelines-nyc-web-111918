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
#----------NAME INPUT EDGE CASE---------------
# name = user_input_downcase
need_a_name = true
while need_a_name == true
  name = user_input_downcase
  if name.length < 2
    puts "Oops... Please try again!".colorize(:green)
    puts "Your name must be longer than 2 characters.".colorize(:green)
    system("say", "oops")
  elsif name.length > 2
  need_a_name = false
  end
end # end of while loop
#----------------------------------------------

system("clear")
sleep(0.5)
puts "                                         "
puts "      __________________________________________________".colorize(:light_yellow)
puts "  🐱 < Please enter your birthday to log in (yyyy-mm-dd).>".colorize(:light_yellow)
puts "      --------------------------------------------------".colorize(:light_yellow)
#----------BIRTHDAY INPUT EDGE CASE---------------
need_a_birthday = true
while need_a_birthday == true
  birthday = user_input
  unless birthday.include?("-") && birthday.length == 10
    puts "Oops... Please try again!".colorize(:green)
    puts "Your birthday must be 10 characters long & include dashes '-'.".colorize(:green)
    system("say", "oops")
  else
  need_a_birthday = false
  end
end # end of while loop
#-------------------------------------------------

if find_by(name, birthday)
  system("clear")
  sleep(0.5)
  puts "                                         "
  puts logo
  puts "                                         "
  puts "      _____________________".light_yellow.bold
  puts "  😸 < Welcome back Trill#{name}!>".light_yellow.bold
  puts "      ---------------------".light_yellow.bold
  puts "                                         "
  system("say", "Hi Trill#{name}!")
else
  create_user(name, birthday)
  puts "Your account has been created! We chose a username for you! Your username is Trill#{name}.".colorize(:light_yellow)
  system("say", "Hi Trill#{name}!")
end

current_user = User.find_by(name: name, birthday: birthday)

#-------------RUNNING APP SECTION -----------------#
leave = nil #this is False because nil is false
until leave == true
#until the user asks to logout keep asking if they want to search
right_keyword = nil
until right_keyword == true

homepage_loop = nil
until homepage_loop == true
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
  elsif options_input == "3"
    system("clear")
    puts "Are your sure you want to delete ALL of your favorite gifs?!! Y/N".colorize(:light_red)
    delete_favorites = user_input_upcase
    if delete_favorites == "Y" && get_users_favorites_url(current_user).empty? == false
      destroy_all_favorites(current_user)
      system("say", "Boom")
      puts "All of Your favorites have been deleted!!".colorize(:red)
    elsif delete_favorites == "N" && get_users_favorites_url(current_user).empty? == false
      puts "Wahoo that was a close one. Your favorites are still saved.".colorize(:light_yellow)
    else
      get_users_favorites_url(current_user).empty?
      puts "Pheww.. you have no saved favorties.".colorize(:light_yellow)
    end
  else
  end
  if options_input == "2"
    homepage_loop = true
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
    system("say", "I love #{keyword}!")
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
save_this_gif = puts "  🐱 < Do you want to SAVE this gif as a favorite? Y/N".colorize(:light_yellow)
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
  if user_input_upcase == "Y" && get_users_favorites_url(current_user).empty? == false
    puts get_users_favorites_url(current_user)
  elsif get_users_favorites_url(current_user).empty?
    puts "Ooo No you have no saved favorites".colorize(:light_yellow)
  elsif user_input_upcase == ""
    system("say", "Blank strings don't upset me.")
  else
  end

  #--------------LOGOUT SECTION---------------------
  options_puts
  logout_options
  answer = user_input
  if answer == "2" || answer.downcase == "logout" || answer.downcase == "exit" || answer.downcase == "n"
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
system("say", "I am a cat! Meee ow!")
