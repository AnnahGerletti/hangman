require_relative '../hangman_game.rb'

require "byebug"
RSpec.describe Game do
  describe "#lives_left" do
    context 'when the game starts with 10 lives' do
      context 'player makes a wrong guess' do
        it 'player has nine lives left' do
          game = Game.new
          game.set_secret(['c','a','t'])

          game.take_turn('b')

          expect(game.lives_left).to eq(9)
        end
      end
      context 'player guesses correctly' do
        it 'player has all their lives' do
          game = Game.new 

          game.set_secret(['c','a','t'])

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
          
          game.set_secret(['g','o'])
          
          game.take_turn('z')
          game.take_turn('n')
    
          expect(game.over?(game.secret)).to be true
        end
      end
      context 'the secret has been guessed' do
        it 'player has made correct guesses' do
          game = Game.new(initial_lives:2)
          game.set_secret(['g','o'])

          game.take_turn('g')
          game.take_turn('o')

          expect(game.over?(game.secret)).to be true
        end
      end
    end
    context 'when the game is not over' do
      context 'there are lives left and you have not guessed the secret' do
        it 'is not over when the game is still in progress' do
          game = Game.new
          
          game.set_secret(['g','o'])

          game.take_turn('o')

          expect(game.over?(game.secret)).to be false

        end
      end
    end
  end
  describe "#lost?" do
    context 'When the game has been lost' do
      context 'When a player has run out of lives' do
        it 'is true when lives are zero' do
          game = Game.new(initial_lives:2)

          game.set_secret(['g','o'])

          game.take_turn('c')
          game.take_turn('s')

          expect(game.lost?).to be true
        end
      end
      context 'when the game has not been lost' do
        it 'is false when there are lives left' do
          game = Game.new(initial_lives:2)

          game.set_secret(['g', 'o'])

          game.take_turn('d')

          expect(game.lost?).to be false
        end
      end
    end
  end
  describe '#won?'do
  let(:game) {Game.new}
    context 'when the game has been won' do
      context 'when the secret word has been guessed' do
        it 'is true when the correct letters been guessed' do

          game.set_secret(['g','o'])

          game.take_turn('g')
          game.take_turn('o')

          expect(game.won?(game.secret)).to be true
        end
      end
      context 'when the secret word has not been guessed' do
        it 'is false when game is in progress' do
           
          game.set_secret(['g','o'])

          game.take_turn('g')

          expect(game.won?(game.secret)).to be false
        end
      end
    end
  end
end
  
