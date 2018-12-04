#interface for users to display what our app does

def welcome
  puts "Meow!! Enjoy kittys here!"
end

def login_name
  puts "Please enter your name."
  name = gets.chomp
end

def find_user(name)
  search_name = User.find_by(name: name)
  #if user name is not found
  if search_name.nil?
  #Please create your account.
    puts "Please create an account."
  #enter your birthday.
    puts "Please enter your birthday (yyyy-mm-dd)"
    birthday = gets.chomp #<-- this should call the birthday method.
    User.create(name: name, username: "Trill#{name}", birthday: "#{birthday}")
    puts "Welcome, your username is Trill#{name}." #<-- this will create a new user.
    start_app
  else
    #if we can not find the user name in the database
      account_found(name)
  end
end

def account_found(name)
  puts "Welcome Trill#{name}."
  puts "Please enter one of these keywords:\n cat\n fail\n star wars\n sleeping\n falling\n cute\n hugging\n traveling\n cold\n dj"
  gets.chomp
end

def start_app
  puts "Please enter one of these keywords:\n cat\n fail\n star wars\n sleeping\n falling\n cute\n hugging\n traveling\n cold\n dj"
  gets.chomp
end
