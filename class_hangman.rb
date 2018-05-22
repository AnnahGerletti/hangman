

class Hangman

  def initialize(view, game, dictionary)
    @view = view
    @game = game
    @dictionary = dictionary
  end

  def start_game
    @view.welcome
    @view.print_dashes(@game, @dictionary.secret)
    # My dashes that are printed don't match my words
    until @game.over?(@dictionary.secret)
      guess = @view.read_guess
      @game.take_turn(guess)
      @view.print_guess_arr(@game.saved_guess)
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
    @secret = SECRET.sample().chars
  end
end

class Game
  attr_reader :saved_guess
  INITIAL_LIVES = 10

  def initialize
   @saved_guess = []
  end

  def over?(word)
    lost? || won?(word)
  end

  def lost?
    INITIAL_LIVES.zero?
  end

  def won?(word)
    word.all? { |letter| saved_guess.include?(letter)}
  end

  def take_turn(guess)
    saved_guess.push(guess)
  end

  def correct_guess(added_guess, word)
    # need to connect this to take_turn or call it in constuctor 
    if word.include?(added_guess)
      return true 
    else
     return false
    end
  end

  def dashes(word)
    word.map do |char|
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
    if turn_result == true
      puts 'Correct guess'
      print_dashes(game, word)
    else 
      puts 'Wrong, Guess again'
      print_dashes(game, word)
    end
  end

  def print_guess_arr(saved_guess)
    print saved_guess
  end

end

Hangman.new(View.new, Game.new, Dictionary.new).start_game

