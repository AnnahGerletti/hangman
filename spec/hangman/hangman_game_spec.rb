# frozen_string_literal: true

require_relative '../../hangman/hangman_game.rb'

RSpec.describe Game do
  describe '#lives_left' do
    context 'when the game starts with 10 lives' do
      context 'player makes a wrong guess' do
        it 'player has nine lives left' do
          game = Game.new(secret: %w[c a t])

          game.take_turn('b')

          expect(game.lives_left).to eq(9)
        end
      end
      context 'player guesses correctly' do
        it 'player has all their lives' do
          game = Game.new(secret: %w[c a t])

          game.take_turn('a')
          expect(game.lives_left).to eq(10)
        end
      end
    end
  end

  describe '#over?' do
    context 'when the game is over' do
      context 'all the lives are gone' do
        it 'player has used all their guesses' do
          game = Game.new(initial_lives: 2, secret: %w[c a t])

          game.take_turn('z')
          game.take_turn('n')

          expect(game.over?).to be true
        end
      end
      context 'the secret has been guessed' do
        it 'player has made correct guesses' do
          game = Game.new(initial_lives: 2, secret: %w[g o])

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
            game = Game.new(secret: %w[g o])

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
          game = Game.new(initial_lives: 2, secret: %w[g o])

          game.take_turn('c')
          game.take_turn('s')

          expect(game.lost?).to be true
        end
      end
    end
    context 'when the game has not been lost' do
      it 'is false when there are lives left' do
        game = Game.new(initial_lives: 2, secret: %w[g o])

        game.take_turn('d')

        expect(game.lost?).to be false
      end
    end
  end

  describe '#won?' do
    let(:game) { Game.new(secret: %w[g o]) }

    context 'when the game has been won' do
      context 'the secret word has been guessed' do
        it 'is true when the correct letters been guessed' do
          game.take_turn('g')
          game.take_turn('o')

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
          game = Game.new(secret: %w[g o])

          initial_guess_size = game.saved_guess.size

          game.take_turn('a')

          expect(game.saved_guess.size).to eq(initial_guess_size + 1)
          expect(game.saved_guess.include?('a')).to be true
        end
      end
    end
  end

  describe '#correct_guess' do
    context 'when a player makes a guess' do
      it 'is checked against the secret word' do
        game = Game.new(secret: %w[g o])

        game.take_turn('o')

        expect(game.secret.include?('o')).to be true
      end
    end
  end

  describe '#dashes' do
    let(:game) { Game.new(secret: %w[g o]) }

    context 'when a game starts' do
      it 'produces all dashes' do
        expect(game.dashes).to eq('-,-')
      end
    end
    context 'guess correctly fill in letter' do
      it 'reveals one letter that is guessed correctly' do
        game.take_turn('g')

        expect(game.dashes).to eq('g,-')
      end
    end
    context 'guess everything right' do
      it 'shows no dashes' do
        game.take_turn('g')
        game.take_turn('o')

        expect(game.dashes).to eq('g,o')
      end
    end
  end

  describe '#charactar_check' do
    context 'When a user enters a response' do
      it 'is a letter between a-z' do
        view = instance_double('View')
        game = Game.new(secret: %w[c a t])

        allow(view).to receive(:read_guess).and_return('a')
        allow(game).to receive(:charactar_check).and_

        expect(game).to receive(:charactar_check).with('a')
    end
  end
end
end