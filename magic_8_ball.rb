@arr = [
  "YES!", "NO!", "MAYBE", "UNDOUBTEDLY!", "MOST CERTAINLY NOT!", 
  "WITH LUCK, IT MAY BE.", "HARD TO SAY RIGHT NOW.", "TRY AGAIN TOMORROW.",
  "POSSIBLY", "NEVER!", "YOU CAN DO BETTER THAN THAT!"
]

@arr_orig = @arr.map { |n| n }


def start
  puts "I am the Magic 8 Ball! What is your question?"
  question = gets.strip
  if question.downcase == "secrets?"
    secret_menu
  else
    question_check(question)
  end
end


def secret_menu
  puts ""
  puts "I've been hacked! How did you get in here?"
  puts "You won't guess the secret combination!"
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
    puts "I told you! Get outta here!"
    exit(0)
  end
end


def add_question
  puts "Fine. What answer would you like to add?"
  @arr << gets.strip.capitalize
  start
end


def reset_questions
  @arr = @arr_orig
  start
end


def question_check(q)
  if q.downcase == "nothing"
    puts ""
    puts "Begone!"
    exit(0)    
  elsif q.end_with?("?") == true
    pick_interlude
  else
    puts "Don't you know all questions end with '?' Ask again!"
    ask
  end
end


def pick_interlude
  puts ""
  arr = ["Good question", "That is a tough one", "Let's see"]
  puts arr.sample + "..."
  puts ""
  pick_response
end


def pick_response
  puts @arr.sample.capitalize
  puts ""
end


while true
  start
end