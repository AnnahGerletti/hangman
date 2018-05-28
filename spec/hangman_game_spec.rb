require_relative '../hangman_game.rb'

require "byebug"
RSpec.describe Game do
  describe "#lives_left" do
    context 'when the game starts with 10 lives' do
      context 'player makes a wrong guess' do 
        it 'player has nine lives left' do
          game = Game.new

          game.take_turn("b")

          expect(game.lives_left).to eq(9)
        end
      end
      context 'player guesses correctly' do
        it 'player has all their lives' do
          game = Game.new

          game.take_turn('a')

          expect(game.lives_left).to eq(10)
      end
    end
  end
end

  describe "#over?" do
    context 'when the game is over' do
      context 'all the lives are gone' do
        it 'player has used all their guesses' do
          game = Game.new(initial_lives: 2)
          secret = ['go']
          
          game.take_turn('z')
          game.take_turn('n')
    
          expect(game.over?(secret)).to be true
        end
      end
      context 'the secret has been guessed' do
        it 'player has made correct guesses' do
          game = Game.new(initial_lives:2)
          secret = ['go']

          game.take_turn('g')
          game.take_turn('o')

          expect(game.over?(secret)).to be true
        end
      end
    end
    context 'when the game is not over' do
      context 'there are lives left and you have not guessed the secret' do
        it 'is not over when the game is still inprogress' do
          game = Game.new
          secret = ['go']

          game.take_turn('o')

          expect(game.over?(secret)).to be 

        end
      end
    end
  end

end
  
