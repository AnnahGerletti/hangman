
class View

  def welcome
    puts 'Welcome to The Hangman Game'
    puts 'You have 10 chances to guess the word'
    puts 'Lets play'
  end

  def read_guess
    puts 'Please guess a letter a-z'
    guess = gets.chomp
  end

  def print(dashes)
    puts dashes
  end

  def print_turn_status(turn_result, game)

    if turn_result == true
      puts 'Correct guess'
    else 
      puts 'Wrong, Guess again'
    end
    print(game.dashes)
    puts "#{game.lives_left} lives remaining"
  end

  def print_guess_arr(saved_guess)
    puts "\t what you have already guesed'
    puts saved_guess.join(' ')
  end

end