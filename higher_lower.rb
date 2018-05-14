# game picks a number
# prompt status of game
# player enters a guess
# guess is checked against random num
# game tells player if number is higher or lower and how many lives they have left
#

class HigherLower
  NUMBERS = Array(1..100)
  INITIAL_LIVES = 6 # constant class var

  def initialize
    @random_num = NUMBERS.sample()
    @lives = INITIAL_LIVES # instance level var
    @won = false
  end

  def print_status
    puts "you have #{@lives} lives left"
    if game_lost?
      puts "game over. The hidden Number was #{@random_num}" 
    elsif game_won?
      puts "winner"
    end
  end

  def game_over? 
    game_lost? || game_won?
    # you have guess the right number
  end

  def game_lost?
     @lives.zero?
  end

  def game_won?
    @won
  end

  def guess(number)
    return false if game_over?

    if number == @random_num
      puts 'You have gueesed the number, You Win!'
      @won = true
    elsif number > @random_num
      puts 'too high'
      @lives -= 1
    else
      puts 'The guess was to low'
      @lives -= 1
    end

    true
  end
end

class PlayHighLow
  def initialize
    @game = HigherLower.new
  end

  def play
    puts 'Welcome to the High Low game!'
    @game.print_status
    puts 'Please guess a Number between 1-100'
    players_guess = gets.chomp
    @game.guess(players_guess)
    # until @game.game_over?
    # end
  end
end

PlayHighLow.new.play
