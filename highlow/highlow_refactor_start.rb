class HigherLower
  def initialize(game, view)
    @game = game
    @view = view
  end

  def start
    @view.welcome
    game_loop until @game.over?
  end

  private

  def game_loop 
    input = @view.read_input(@game)
    turn_result = @game.take_turn(input)
    @view.print_turn_status(turn_result, @game)
  end
end
