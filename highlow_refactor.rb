# game picks a number
# prompt status of game
# player enters a guess
# guess is checked against random num
# game tells player if number is higher or lower and how many lives they have left
#

class HigherLower
  def initialize(game, view)
    @game = game
    @view = view
  end

  def start
    @view.welcome
    until @game.over?
      input = @view.read_input(@game)
      turn_result = @game.take_turn(input)
      @view.print_turn_status(turn_result, @game)
    end
  end
end

class Game
  NUMBERS = Array(1..100)
  INITIAL_LIVES = 6
  
  def initialize
    @random_num = NUMBERS.sample()
    @saved_guess = []
  end

  def valid_guess?(input)
    input >0 && input < 100
  end

  def over?
    lost? || won?
  end

  def lost?
    @saved_guess.length == 6
  end

  def won?
    @saved_guess.include?(@random_num)
  end

  def take_turn(input)
    @saved_guess.push(input)
    input - @random_num
  end

  def hidden_num
    @random_num
  end

  def lives_left
    if won?
      INITIAL_LIVES - @saved_guess.length + 1
    else 
      INITIAL_LIVES - @saved_guess.length
    end
  end
end

class View
  def tohigh_or_tolow(turn_result)
    if turn_result.positive?
      puts 'Too High'
    elsif turn_result.negative?
      puts 'Too Low'
    else
      puts 'Just Right'
    end
    turn_result
  end

  def print_turn_status(turn_result, game)
    tohigh_or_tolow(turn_result)
    
    if game.lost?
      puts "game over. The hidden Number was #{game.hidden_num}"
    elsif game.won?
      puts 'Winner'
    end

   puts "#{game.lives_left} lives remaining"
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

HigherLower.new(Game.new, View.new).start
