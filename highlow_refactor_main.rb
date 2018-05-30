require_relative './highlow_refactor'

class HigherLower
  def initialize(game, view)
    @game = game
    @view = view
  end

  def start
    @view.welcome
    until @game.over?
      input = @view.read_input(@game)
      turn_result = @game.take_turn(input)
      @view.print_turn_status(turn_result, @game)
    end
  end
end

HigherLower.new(Game.new, View.new).start