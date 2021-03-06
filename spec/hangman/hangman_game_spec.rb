# frozen_string_literal: true

require_relative '../../hangman/hangman_game.rb'

class MockDictionary
  def word
    %w[c a t]
  end
end

RSpec.describe Game do
  let(:mock_dictionary) {instance_double('Dictionary')}
  let(:game) {Game.new(mock_dictionary, initial_lives: 2)}

  before(:each) do 
    allow(mock_dictionary).to receive(:word).and_return(%w[c a t])
  end

  describe '#lives_left' do
    context 'when the game starts with 10 lives' do
      context 'player makes a wrong guess' do
        it 'player has nine lives left' do

          game.take_turn('b')

          expect(game.lives_left).to eq(1)
        end
      end
      context 'player guesses correctly' do
        it 'player has all their lives' do

          game.take_turn('a')
          expect(game.lives_left).to eq(2)
        end
      end
    end
  end

  describe '#over?' do
    context 'when the game is over' do
      context 'all the lives are gone' do
        it 'player has used all their guesses' do

          game.take_turn('z')
          game.take_turn('n')

          expect(game.over?).to be true
        end
      end
      context 'the secret has been guessed' do
        it 'player has made correct guesses' do

          game.take_turn('g')
          game.take_turn('o')

          expect(game.over?).to be true
        end
      end
    end
    context 'when the game is not over' do
      context 'there are lives left' do
        context 'you have not guessed the secret' do
          it 'is not over when the game is still in progress' do

            game.take_turn('o')

            expect(game.over?).to be false
          end
        end
      end
    end
  end

  describe '#lost?' do
    context 'When the game has been lost' do
      context 'a player has run out of lives' do
        it 'is true when lives are zero' do

          game.take_turn('f')
          game.take_turn('g')

          expect(game.lost?).to be true
        end
      end
    end
    context 'when the game has not been lost' do
      it 'is false when there are lives left' do

        game.take_turn('d')

        expect(game.lost?).to be false
      end
    end
  end

  describe '#won?' do
    context 'when the game has been won' do
      context 'the secret word has been guessed' do
        it 'is true when the correct letters been guessed' do
          game.take_turn('c')
          game.take_turn('a')
          game.take_turn('t')

          expect(game.won?).to be true
        end
      end
      context 'the secret word has not been guessed' do
        it 'is false when game is in progress' do
          game.take_turn('g')

          expect(game.won?).to be false
        end
      end
    end
  end

  describe '#take_turn' do
    context 'when a player makes a guess' do
      context 'check the correct char is added' do
        it 'saves gueses to the guess array' do

          initial_guess_size = game.saved_guess.size

          game.take_turn('a')

          expect(game.saved_guess.size).to eq(initial_guess_size + 1)
          expect(game.saved_guess.include?('a')).to be true
        end
      end
    end
  end

  describe '#correct_guess?' do
    context 'when a player makes a guess' do
      it 'is checked against the secret word' do

        expect(game.correct_guess?('c')).to be true
      end
    end
  end

  describe '#dashes' do

    context 'when a game starts' do
      it 'produces all dashes' do
        expect(game.dashes).to eq('-,-,-')
      end
    end
    context 'guess correctly fill in letter' do
      it 'reveals one letter that is guessed correctly' do
        game.take_turn('c')

        expect(game.dashes).to eq('c,-,-')
      end
    end
    context 'guess everything right' do
      it 'shows no dashes' do
        game.take_turn('c')
        game.take_turn('a')
        game.take_turn('t')

        expect(game.dashes).to eq('c,a,t')
      end
    end
  end
end
