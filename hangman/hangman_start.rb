# frozen_string_literal: true


class Hangman_start
  def initialize(view, game, validation)
    @view = view
    @game = game
    @validation = validation
  end

  def start(_view)
    @view.welcome
    @view.print(@game.dashes)
    game_loop until @game.over?
  end

  def game_loop
    guess = @view.read_guess

    if @validation.charactar_check?(guess)
      @game.take_turn(guess)
      turn_result = @game.correct_guess?(guess)

      @view.print_end_of_turn_messages(turn_result, @game.lives_left, @game.dashes, @game.saved_guess)
    else
      @view.invalid_input
    end
  end
end