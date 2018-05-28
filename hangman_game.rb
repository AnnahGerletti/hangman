require_relative './hangman_dictionary.rb'

class Game
  attr_reader :saved_guess, :initial_lives, :secret

  def initialize(initial_lives: 10)
   @saved_guess = []
   @initial_lives = initial_lives
   @secret = Dictionary.new.secret
  end

  def set_secret (new_secret) # override the dictionary secret, with a set secret written in the test.
    @secret = new_secret
  end

  def lives_left
    initial_lives - (saved_guess.uniq - secret).size
  end

  def over?(secret)
    lost? || won?(secret)
  end

  def lost?
    lives_left.zero?
  end

  def won?(secret)
    secret.all? do |letter|
      saved_guess.include?(letter)
    end
  end

  def take_turn(guess)
    saved_guess.push(guess)
  end

  def correct_guess(added_guess, secret)
    if secret.include?(added_guess)
     true
    else
     false
    end
  end

  def dashes(secret)
    secret.map do |char|
      if saved_guess.include?(char)
        char
      else
        '-'
      end
    end.join ','
  end
end