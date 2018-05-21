

class Hangman

  def initialize(view, game, dictionary)
    @view = view
    @game = game
    @dictionary = dictionary
  end

  def start_game
    @view.welcome
    @view.print_dashes(@game)
    until @game.over?
      guess = @view.read_guess
      turn_result = @game.take_turn(guess)
      @view.print_turn_status(turn_result, @game)
    end
  end
end


class Dictionary
  SECRET = ['private', 'lacking', 'apple']

  def initialize
    @secret = SECRET.sample().chars
  end

  def secret_word
    @secret
  end
end

class Game
  INITIAL_LIVES = 10

  def initialize
   @saved_guess = []
  end

  def over?
    puts 'OVER'
    lost? || won?
  end

  def lost?
    puts 'OVER 1'
    INITIAL_LIVES.zero? 
  end

  def won?
    # How do I see the word that is randomly picked
    puts 'OVER 2'
    Dictionary::SECRET.all? { |letter| @saved_guess.include?(letter)}
  end

  def take_turn(guess)
    @saved_guess.push(guess)
    puts "#{@saved_guess}"
  end

  def dashes
    Dictionary::SECRET.map do |char|
      if @saved_guess.include?(char)
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
    puts 'OVER 3'
    puts 'Please guess a letter a-z'
    guess = gets.chomp
  end

  def print_dashes(game)
    puts game.dashes
  end

end

Hangman.new(View.new, Game.new, Dictionary.new).start_game

