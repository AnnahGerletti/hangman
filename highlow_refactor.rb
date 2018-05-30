

# frozen_string_literal: true

class Game
  attr_reader :saved_guess, :random_num, :initial_lives
  NUMBERS = Array(1..100)

  def initialize(random_num: NUMBERS.sample, initial_lives: 6)
    @random_num = random_num
    @saved_guess = []
    @initial_lives = initial_lives
  end

  def valid_guess?(input)
    input.positive? && input < 100
  end

  def over?
    lost? || won?
  end

  def lost?
    saved_guess.length == initial_lives
  end

  def won?
    saved_guess.include?(random_num)
  end

  def take_turn(input)
    @saved_guess.push(input)
    input - random_num
  end

  def lives_left
    initial_lives - saved_guess.length
  end
end

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
