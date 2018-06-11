
# frozen_string_literal: true

class View
  def initialize(strings)
    @strings = strings
  end

  def welcome
    puts @strings.design
    puts @strings.hi_msg
    puts @strings.lives_msg
    puts @strings.rules_msg
    puts 'Lets play!'
    puts @strings.design
  end

  def read_guess
    gets.chomp
  end

  def print(dashes)
    puts "\t #{dashes}"
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
