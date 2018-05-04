# Second attept to Hangman
# more structured

# setup
lives = 10
guess_arr = []
won = false

SECRET = 'ball'.chars

def dashes(guess_arr)
 SECRET.map do |chr|
   if guess_arr.include? chr
    chr
   else
    '-'
   end
  end.join ','
end

def check_win
  if SECRET.include? '-'
    won = false
  else
    won = true
    puts 'You are a Winner'
  end
end

puts 'Normal Hangman rules'
puts 'You have 10 lives to guess the word'
puts 'Every Worng guess you will lose a life'
puts 'Here we go'

  while lives >= 0 
    puts 'guess a letter'
    guess = gets.chomp
    guess_arr.push(guess)
    check_win
    
    if SECRET.include? guess
      puts 'that was a correct guess'
      print guess_arr
    else
      puts 'nope, guess again'
      puts "you have #{lives} lives left"
      lives -= 1
      puts 'this is what you have already guessed'
      puts guess_arr.to_s
    end
    puts dashes guess_arr
  end

