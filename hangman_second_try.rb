# Second attept to Hangman
# more structured

# setup
lives = 9
guess_arr = []

SECRET = 'ball'.chars

def dashes(guess_arr)
  SECRET.map do |chr|
    
   if guess_arr.include?(chr)
    chr
   else
    '-'
   end
  end.join ','
end

def game_won?(guess_arr)
  SECRET.each do |char|
    if !guess_arr.include?(char)
      return false
    end
  end
   true
end

# checks to see if the game has been won
def game_won_2?(guess_arr)
  SECRET.all? { |letter| guess_arr.include?(letter) }
end

def game_over?(lives, guess_arr)
  lives <= 0 || game_won?(guess_arr)
end

def ran_out_of_lives?(lives)
  if lives.zero?
    puts 'You ran out of lives'
    puts "The word was #{SECRET}"
  end
end

puts 'Normal Hangman rules'
puts 'You have 10 lives to guess the word'
puts 'Every Wrong guess you will lose a life'
puts 'Here we go'

  until game_over?(lives, guess_arr)
    puts 'Guess a letter:'
    guess = gets.chomp
    guess_arr.push(guess)

    if SECRET.include?(guess)
      puts 'that was a correct guess'
      print guess_arr
    else
      puts 'Nope, guess again:'
      puts "You have #{lives} lives left"

      lives -= 1

      puts 'What you have already guessed'
      puts guess_arr.to_s
    end
    
    puts dashes(guess_arr)

    puts ran_out_of_lives?(lives)

    if game_won_2?(guess_arr)
      puts 'Congradulations, You Won the game!'
    end
  end
