require "colorize"

@arr = [
  "YES!", "NO!", "MAYBE", "UNDOUBTEDLY!", "MOST CERTAINLY NOT!", 
  "WITH LUCK, IT MAY BE.", "HARD TO SAY RIGHT NOW.", "TRY AGAIN TOMORROW.",
  "POSSIBLY", "NEVER!", "YOU CAN DO BETTER THAN THAT!", "IF YOU PRACTICE"
]

@arr_orig = @arr.map { |n| n }


def start
  puts ""
  puts "I am the Magic 8 Ball! What is your question?".blue
  puts "It had better not be 'nothing'!".red
  question = gets.strip
  if question.downcase == "secrets?"
    secret_menu
  else
    question_check(question)
  end
end


def secret_menu
  puts ""
  puts "I've been hacked! How did you get in here?".green
  puts "You won't guess the secret combination!".green
  pass = gets.to_i
  check_password(pass)
end


def check_password(pass)
  case pass
  when 1234
    add_question
  when 4321
    reset_questions
  else
    puts "You'll never guess it! Get outta here!".red
    exit(0)
  end
end


def add_question
  puts "Fine. What answer would you like to add?".green
  @arr << gets.strip.capitalize
  start
end


def reset_questions
  puts "All changes cleared!".green
  @arr = @arr_orig
  start
end


def question_check(q)
  if q.downcase == "nothing"
    puts ""
    puts "Begone!".red
    exit(0)    
  elsif q.end_with?("?") == true
    pick_interlude
  else
    puts "Don't you know all questions end with '?' Ask again!".red
    puts ""
    start
  end
end


def secret_chance
  chance = rand(20).ceil + 1
  case chance
    when 18, 19, 20
      puts "Don't ask me about secrets.".green
    when 1
      puts "1234 is NOT a secret combination".green
    when 2
      puts "Don't try 4321. It isn't a secret".green
  else
  end
end  


def pick_interlude
  puts ""
  arr = ["Good question", "That is a tough one", "Let's see"]
  secret_chance
  puts arr.sample.cyan + "...".cyan
  puts ""
  pick_response
end


def pick_response
  puts "Your answer is: ".cyan + @arr.sample.capitalize.yellow
  puts ""
  puts "========================="
end


while true
  start
end