numbers = Array(1..100)
random_num = numbers.sample()

lives = 6

#game picks a number
#player enters a guess
#guess is checked against random num
#game tells player if number is higher or lower and how many lives they have left
#

class GuessNum
  def initialize(guess)
    @guess = guess
  end

  def greater_than(guess)
    if @guess >= 50

