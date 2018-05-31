class Hangman_start
  attr_accessor(:view)

  def initialize(view, game)
    @view = view
    @game = game
  end

  def start(view)
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