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
  end

  def status
    puts "you have #{@lives} lives left"
  end

  def guess(number)
    if number == @random_num
      puts 'You have gueesed the number, You Win!'
    elsif number > @random_num
      puts 'too high'
      @lives -= 1
    else
      puts 'The guess was to low'
      @lives -= 1
    end
  end
end
