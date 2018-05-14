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

  def valid_guess?(input) 
    # to_i turns non integers to zero.
    player_guess = input.to_i
    player_guess > 0 && player_guess < 100
  end

  def guess(number)
    return false if game_over?

    if number == @random_num
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
    until @game.game_over?
      @game.print_status
      puts 'Please guess a Number between 1-100'
      player_guess = gets.chomp.to_i
      if @game.valid_guess?(player_guess)
        @game.guess(player_guess)
      else
        puts 'Invalid answer guess again'
      end

    end
    @game.print_status
  end
end

PlayHighLow.new.play
