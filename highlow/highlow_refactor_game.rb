

# frozen_string_literal: true

class Game
  attr_reader :saved_guess, :random_num, :initial_lives
  NUMBERS = Array(1..100)

  def initialize(random_num: NUMBERS.sample, initial_lives: 6)
    @random_num = random_num
    @saved_guess = []
    @initial_lives = initial_lives
  end

  def won?
    saved_guess.include?(random_num)
  end

  def lost?
    saved_guess.length == initial_lives
  end

  def over?
    lost? || won?
  end

  def valid_guess?(input)
    input.positive? && input < 100
  end

  def lives_left
    initial_lives - saved_guess.length
  end
  
  def take_turn(input)
    @saved_guess.push(input)
    input - random_num
  end

end
