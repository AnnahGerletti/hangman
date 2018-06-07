# frozen_string_literal: true

require_relative '../../hangman/hangman_start.rb'

RSpec.describe Hangman_start do
  describe '#start' do
    context 'When the game begins' do
      context 'player recieves beginning message' do
        it 'player sees welcome message' do
          view = double(:view, welcome: true, print: true)
          game = double(:game, dashes: true, over?: true)

          expect(view).to receive(:welcome)

          Hangman_start.new(view, game).start(view)
        end

        context 'When the secret word is changed to dashes' do
          it 'player sees dashes' do
            view = double(:view, welcome: true, print: true)
            game = double(:game, dashes: true, over?: true)

            expect(view).to receive(:print).with(game.dashes)

            Hangman_start.new(view, game).start(view)
          end
        end
      end
    end

    context 'when the game is playing' do
      it 'plays through till it is over' do
        view = instance_double('View')
        game = instance_double('Game')

        allow(view).to receive(:welcome)
        allow(view).to receive(:print)
        allow(view).to receive(:read_guess)
        allow(view).to receive(:print_guess_arr)
        allow(view).to receive(:print_dashes)
        allow(game).to receive(:dashes)
        allow(game).to receive(:take_turn)
        allow(game).to receive(:saved_guess)
        allow(game).to receive(:lives_left)
        allow(game).to receive(:correct_guess)
        allow(game).to receive(:charactar_check)

        # expect(view).to receive(:print).with(game.dashes, true)

        expect(game).to receive(:over?).and_return(
          false,
          true
        )

        expect(view).to receive(:print_turn_status).exactly(1).times

        Hangman_start.new(view, game).start(view)
      end
    end

    context 'when the game is in progress' do
      it 'runs through game loop' do
        
      end
    end
  end
end
