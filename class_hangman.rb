Hangman.new(Dictionary.new, Game.new, View.new).start_game

class Hangman
  attr_reader :view, :game, :dictionary

  def initalize(view, game, dictionary)
    @view = view
    @game = game
    @dictionary = dictionary
  end

  def start_game

  end
end


class Dictionary
  SECRET = ['private', 'lackadaisical', 'abdicate']
end

class Game
  INITIAL_LIVES = 10

  

end


