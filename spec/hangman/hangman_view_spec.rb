require_relative '../../hangman/hangman_view.rb'


RSpec.describe View do
  describe '#print_turn_status' do
    context 'When a player has taken a turn' do
      it 'prints the correct response' do
       
        view = View.new
        game = instance_double('Game')
        
        allow(game).to receive(:dashes)
        allow(game).to receive(:lives_left)

        expect{ view.print_turn_result(true) }.to output(/Correct guess\n/).to_stdout

      end
    end
  end
end