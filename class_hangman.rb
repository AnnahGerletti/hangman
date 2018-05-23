require "byebug"

class Hangman

  def initialize(view, game, dictionary)
    @view = view
    @game = game
    @dictionary = dictionary
  end

  def start_game
    @view.welcome
    @view.print_dashes(@game, @dictionary.secret)
    until @game.over?(@dictionary.secret)
      guess = @view.read_guess
      @game.take_turn(guess)
      @view.print_guess_arr(@game.saved_guess)
      @game.lives_left( @dictionary.secret)
      turn_result = @game.correct_guess(guess, @dictionary.secret)
      @view.print_turn_status(turn_result, @game, @dictionary.secret)
    end
  end
end


# Dictionary::SECRET # => blueprint
# @dictionary = Dictionary.new # => house
class Dictionary
  attr_reader :secret
  SECRET = ['watermelon', 'orange', 'apple', 'kiwi', 'grape']

  def initialize
    @secret = SECRET.sample.chars
  end
end

class Game
  attr_reader :saved_guess, :initial_lives

  def initialize
   @saved_guess = []
   @initial_lives = 10
  end

  def lives_left(secret)
    initial_lives - (saved_guess.uniq - secret).size
  end

  def over?(secret)
    lost? || won?(secret)
  end

  def lost?
    initial_lives.zero?
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

class View

  def welcome
    puts 'Welcome to The Hangman Game'
    puts 'You have 10 chances to guess the word'
    puts 'Lets play'
  end

  def read_guess
    puts 'Please guess a letter a-z'
    guess = gets.chomp
  end

  def print_dashes(game, word)
    puts game.dashes(word)
  end

  def print_turn_status(turn_result, game, word)

    saved_guess = game.saved_guess

    if turn_result == true
      puts 'Correct guess'
    else 
      puts 'Wrong, Guess again'
    end
    print_dashes(game, word)
    puts "#{game.lives_left(word)} lives remaining"
  end

  def print_guess_arr(saved_guess)
    print saved_guess
  end

end

Hangman.new(View.new, Game.new, Dictionary.new).start_game

