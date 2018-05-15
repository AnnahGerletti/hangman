# game picks a number
# prompt status of game
# player enters a guess
# guess is checked against random num
# game tells player if number is higher or lower and how many lives they have left
#

class HigherLower

  def initialize
    @game = HigherLowerGame.new
    @view = HigherLowerView.new
  end

  def start
    @view.welcome
    until @game.over?
      input = @view.read_input(input)
      turn_result = @game.take_turn(input)
      @view.print_turn_status(turn_result)
    end
  end
end

class HigherLowerGame
  NUMBERS = Array(1..100)
  INITIAL_LIVES = 6 # constant class var
  
  def initialize
    @random_num = NUMBERS.sample()
    @saved_guess = []
    @lives = INITIAL_LIVES
  end

  def over?
    puts "hello the random num is #{@random_num}"
    lost? || won?
  end

  def lost?
    @lives.zero? || @saved_guess.length == 6
  end

  def won?
    @saved_guess.include?(@random_num)
  end

  def take_turn(input)
    
  end


end

class HigherLowerView
  INITIAL_LIVES = 6 # constant class var

  def initialize
    @saved_guess = []
    @lives = INITIAL_LIVES
  end

  def print_turn_status(turn_result)
    puts "you have #{@lives} lives left"
    if lost?
      puts "game over. The hidden Number was #{@random_num}"
    elsif won?
      puts 'Winner'
    end
  end

  def welcome
    puts 'Welcome to the High Low game!'
    puts 'You have 6 chances to guess the right number'
  end

  def read_input(input)
    puts 'Please guess a Number between 1-100'
    input = gets.chomp
    @saved_guess.push(input)
    puts "#{@saved_guess}"
    @lives =- 1

  end
end

HigherLower.new.start
