require_relative './hangman_game'
require_relative './hangman_view'
require_relative './hangman_dictionary'

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
      @game.lives_left
      turn_result = @game.correct_guess(guess, @dictionary.secret)
      @view.print_turn_status(turn_result, @game, @dictionary.secret)
    end
  end
end

Hangman.new(View.new, Game.new, Dictionary.new).start_game

## toh's stuff
view = View.new
game = Game.new
dict = Dictionary.new

Hangman.new(view, game, dict)