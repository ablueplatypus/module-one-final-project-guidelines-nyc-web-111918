require_relative '../config/environment'

#LOGIN SECTION
system("clear")
welcome
puts "Please enter your name."
name = user_input
system("clear")
puts "Please enter your birthday to log in (yyyy-mm-dd)."
birthday = user_input
# checks if user exists
if find_or_create_user(name, birthday) == User.find_by(name: name, birthday: birthday)
  system("clear")
  puts "Welcome back Trill#{name}!"
else
  puts "Your account has been created! Your username is Trill#{name}."
end
current_user = User.find_by(name: name, birthday: birthday)

#------RUNNING APP SECTION -----------------#
leave = nil #this is False because nil is false
until leave == true
#We want this process to repeat.
#until the user asks to logout keep asking if they want to search

right_keyword = nil
until right_keyword == true
  puts "Please enter one of these keywords:"
  string_keywords # string array returns nil
  keyword = user_input
  system("clear")
  if keywords_returns_true.include?(keyword) == false # we want string array to return true
    system("clear")
    puts "Ummm... That is not a keyword, please enter a valid keyword."
  else
    find_keyword_in_titles(keyword)
    url = return_random_gif_url(keyword)
    system("clear")
    new_gif = create_new_gif(keyword, url)
    p url
    puts "Are you ready to see a TRILL GIF?!?!!"
    sleep(3)
    # binding.pry
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
  puts "Do you want any more cats? Y/N"
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
