
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

  def print_dashes(game, word)
    puts game.dashes(word)
  end

  def print_turn_status(turn_result, game, word)

    saved_guess = game.saved_guess

    if turn_result == true
      puts 'Correct guess'
    else 
      puts 'Wrong, Guess again'
    end
    print_dashes(game, word)
    puts "#{game.lives_left} lives remaining"
  end

  def print_guess_arr(saved_guess)
    print saved_guess
  end

end