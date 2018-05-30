require_relative './hangman_game'
require_relative './hangman_view'
require_relative './hangman_dictionary'

class Hangman

  def initialize(view, game)
    @view = view
    @game = game
  end

  def start_game
    @view.welcome
    @view.print(@game.dashes)
    until @game.over?
      guess = @view.read_guess
      @game.take_turn(guess)
      @view.print_guess_arr(@game.saved_guess)
      @game.lives_left
      turn_result = @game.correct_guess(guess)
      @view.print_turn_status(turn_result, @game)
    end
  end
end

# test welcomes the user 
# expect(view).to receive(:print).with(game.dashes)

# it plays until the game is over
# context 'when the game is running'
#   it 'continues playing' do
#     expect(game).to receive(:over?).and_return(
#       false,
#       true
#    )
#    expect(view).to receive(:print_turn_status).exactly(2).times

# it accepts guesses from the user
# expect(view).to receive(:read_guess).and_return('a')
# expect(game).to receive(:take_turn).with('a')

# it prints turn result


# Hangman.new(View.new, Game.new(secret: Dictionary.new.word_sample)).start_game

## toh's stuff
view = View.new
dict = Dictionary.new
game = Game.new(secret: dict.word)

Hangman.new(view, game).start_game