# frozen_string_literal: true

require_relative '../../highlow/highlow_refactor_start.rb'
require_relative '../../highlow/highlow_refactor_game.rb'
require_relative '../../highlow/highlow_refactor_view.rb'

RSpec.describe HigherLower do
  describe '#start' do
    context 'When the game begins' do
      context 'player recieves beginning message' do
        it 'welcomes player' do
          view = instance_double("View")
          game = instance_double("Game")

          allow(game).to receive(:over?).and_return(true)

          expect(view).to receive(:welcome)

          HigherLower.new(game, view).start
        end
      end

      context 'and a turn is taken' do
        it 'prints out the game status' do 
          game = Game.new
          view = View.new
          higherlower = HigherLower.new(game, view)

          
          allow(game).to receive(:over?).and_return(
            false,
            true
            )
          allow(view).to receive(:read_input).and_return(44)
          allow(game).to receive(:take_turn).and_return(10)


          

          expect(higherlower).to receive(:game_loop).and_call_original
          expect(game).to receive(:take_turn).with(44)
          expect(view).to receive(:print_turn_status).with(10, game)

          higherlower.start

        end
      end
    end
  end
end

# some_test
#   game = instance_double(Game)

#   allow(gmae).to_receive(lives_left).and_return(5)
#   allow(gmae).to_receive(lives_left).and_return(10)
#   print_turn_status(true, gmae)
# end