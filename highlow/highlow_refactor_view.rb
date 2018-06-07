class View
  def tohigh_or_tolow(turn_result)
    if turn_result.positive?
      puts "\tToo High"
    elsif turn_result.negative?
      puts "\tToo Low"
    else
      puts "\tJust Right"
    end
    turn_result
  end

  def print_turn_status(turn_result, game)
    tohigh_or_tolow(turn_result)

    if game.lost?
      puts "Game Over. The hidden Number was #{game.random_num}"
    elsif game.won?
      puts 'Winner'
    end

    puts "#{game.lives_left} lives left"
  end

  def welcome
    puts 'Welcome to the High Low game!'
    puts 'You have 6 chances to guess the right number'
  end

  def read_input(game)
    puts 'Please guess a Number between 1-100'
    input = gets.chomp.to_i

    until game.valid_guess?(input)
      puts 'enter valid number'
      input = gets.chomp.to_i
    end
    input
  end
end