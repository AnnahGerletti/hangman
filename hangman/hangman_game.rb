

# frozen_string_literal: true

class Game
  attr_reader :saved_guess, :initial_lives, :secret

  def initialize(dict, initial_lives: 10)
    @saved_guess = []
    @initial_lives = initial_lives
    @secret = dict.word
  end

  def set_secret(new_secret) # override the dictionary secret, with a set secret written in the test.
    @secret = new_secret
  end

  def lives_left
    initial_lives - (saved_guess.uniq - secret).size
  end

  def over?
    lost? || won?
  end

  def lost?
    lives_left.zero?
  end

  def won?
    secret.all? do |letter|
      saved_guess.include?(letter)
    end
  end

  def take_turn(guess)
      saved_guess.push(guess)
  end

  def correct_guess(checked_guess)
    secret.include?(checked_guess)
  end

  def dashes
    secret.map do |char|
      if saved_guess.include?(char)
        char
      else
        '-'
      end
    end.join ','
  end

  def charactar_check(guess)
    guess.each_char do |char|
      if char.match(/\A[a-z]\z/)
        take_turn(char)
      else
        puts "\t #{char} is not a valid guess"
      end
    end 
  end

end
