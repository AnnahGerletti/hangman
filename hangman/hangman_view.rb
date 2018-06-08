
# frozen_string_literal: true

class View
  def welcome
    puts 'Welcome to The Hangman Game'
    puts 'You have 10 chances to guess the word'
    puts 'Lets play'
  end

  def read_guess
    puts 'Please guess a letter a-z'
    gets.chomp
  end

  def print(dashes)
    puts dashes
  end

  def print_turn_result(turn_result)
    if turn_result == true
      puts "\t Correct guess"
    else
      puts "\t Wrong Guess"
    end
  end

  def print_dashes(game)
    print(game.dashes)
    puts "\t #{game.lives_left} lives remaining"
  end

  def print_guess_arr(saved_guess)
    puts "\t what has been guessed => #{saved_guess.join(' ')}"
  end
end
