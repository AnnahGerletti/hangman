
# frozen_string_literal: true

class View
  def initialize(gameStrings)
    @gameStrings = gameStrings
  end

  def welcome
    puts @gameStrings.design
    puts @gameStrings.hi_msg
    puts @gameStrings.lives_msg
    puts @gameStrings.rules_msg
    puts 'Lets play!'
    puts @gameStrings.design
  end

  def read_guess
    gets.chomp
  end

  def print(dashes)
    puts "\t #{dashes}"
  end

  def print_turn_result(turn_result)
    if turn_result == true
      puts correct_str
    else
      puts "\t Wrong Guess"
    end
  end

  def correct_str
    "\t Correct guess"
  end

  def print_dashes(lives_left, dashes)
    print(dashes)
    puts "\t #{lives_left} lives remaining"
  end

  def print_guess_arr(saved_guess)
    puts "\t what has been guessed => #{saved_guess.join(' ')}"
  end
end

class SpanishHangManView < View
  def correct_str
    'Correcto guesso'
  end
end