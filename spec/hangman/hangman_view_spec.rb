# frozen_string_literal: true

require_relative '../../hangman/hangman_view.rb'
require_relative '../../hangman/hangman_strings.rb'

RSpec.describe View do
  describe '#print_turn_status' do
    context 'When a player has taken a turn' do
      it 'prints the correct response' do
        mock_gameStrings = instance_double('EnglishGame')
        view = View.new(mock_gameStrings)

        expect { view.print_turn_result(false) }.to output(/Wrong Guess/).to_stdout
      end
    end
  end
end
