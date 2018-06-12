require_relative './hangman_game'
require_relative './hangman_view'
require_relative './hangman_dictionary'
require_relative './hangman_start'
require_relative './hangman_strings'
require_relative './hangman_charcheck'

gameStrings = EnglishGame.new
view = View.new(gameStrings)
dict = Dictionary.new
validation = CharCheck.new
game = Game.new(dict)

Hangman_start.new(view, game, validation).start(view)
