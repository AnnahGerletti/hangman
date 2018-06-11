require_relative './hangman_game'
require_relative './hangman_view'
require_relative './hangman_dictionary'
require_relative './hangman_start'
require_relative './hangman_strings'
# test welcomes the user 
# expect(view).to receive(:print).with(game.dashes)

# it plays until the game is over
# context 'when the game is running'
#   it 'continues playing' do
#     expect(game).to receive(:over?).and_return(
#       false,
#       true
#    )
#    expect(view).to receive(:print_turn_result).exactly(2).times

# it accepts guesses from the user
# expect(view).to receive(:read_guess).and_return('a')
# expect(game).to receive(:take_turn).with('a')

# it prints turn result


# Hangman.new(View.new, Game.new(secret: Dictionary.new.word_sample)).start_game

## toh's stuff
gameStrings = EnglishGame.new
view = View.new(gameStrings)
dict = Dictionary.new
game = Game.new(dict)

Hangman_start.new(view, game).start(view)
