require_relative '../config/environment'

#LOGIN SECTION
system("clear")
welcome
puts "     Please enter your name."
name = user_input
system("clear")
puts "🐱 < Please enter your birthday to log in (yyyy-mm-dd)."
birthday = user_input
# checks if user exists
if find_or_create_user(name, birthday) == User.find_by(name: name, birthday: birthday)
  system("clear")
  puts "😸 < Welcome Trill#{name}!"
else
  puts "Your account has been created! We chose a username for you! Your username is Trill#{name}."
end

current_user = User.find_by(name: name, birthday: birthday)

#------RUNNING APP SECTION -----------------#
leave = nil #this is False because nil is false
until leave == true
#until the user asks to logout keep asking if they want to search
right_keyword = nil
until right_keyword == true

ask_fav = nil
until ask_fav == true
  puts "🐱 < Please choose one of the options."
  homepage_options
  options_input = user_input
  if options_input == "1"
    if get_users_favorites_url(current_user).empty?
      puts "Sorry. You have no saved favorites."
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
    puts "     Ummm... That is not a keyword, please enter a valid keyword."
  else
    find_keyword_in_titles(keyword)
    url = return_random_gif_url(keyword)
    system("clear")
    new_gif = create_new_gif(keyword, url)
    p url
    puts "Are you ready to see a TRILL GIF?!?!!"
    countdown_with_sleep(3)
    system('open', url)
    right_keyword = true
  end
end # end of until wrong_keyword

system("clear")
# save favorites
save_this_gif = puts "Do you want to save this gif as a favorite? Y/N"
yes_no = user_input_upcase
# answer = user_input
  if yes_no == "N"
    system("clear")
    puts "O.K. This gif was not saved."
  else yes_no == "Y"
    create_favorite(current_user, new_gif)
    system("clear")
    puts "You have saved this gif to your favorites!"
  end
  # Do you want to see your favorites????
  system("clear")
  puts "Do you want to see all of your saved favorites? Y/N"
  if user_input_upcase == "Y"
    puts get_users_favorites_url(current_user)
  end

  # puts "pretty spaces +++++++++++++++++++++++++++++++++="
  puts "Do you want any more cats? If 'N' you will logout. Y/N"
  answer = user_input_upcase
  if answer == "N"
    leave = true
  end
end # end of until leave

# puts "Do you want logout? Y/N"
#if they say Y, the app exits.
#if they say N, the app ask them to search a keyword.

system("clear")
puts "You have logged out! BYE BYE!"
