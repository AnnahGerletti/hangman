# frozen_string_literal: true

class Hangman_start
  def initialize(view, game)
    @view = view
    @game = game
  end

  def start(_view)
    @view.welcome
    @view.print(@game.dashes)
    game_loop until @game.over?
  end

  def game_loop
    guess = @view.read_guess
    checked_guess = @game.charactar_check(guess)
    @game.lives_left
    turn_result = @game.correct_guess(checked_guess)
    @view.print_turn_result(turn_result)
    @view.print_dashes(@game)
    @view.print_guess_arr(@game.saved_guess)
  end
end
