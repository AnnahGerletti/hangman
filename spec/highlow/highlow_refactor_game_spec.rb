# frozen_string_literal: true

require_relative '../../highlow/highlow_refactor_game'

RSpec.describe Game do
  let(:game) { Game.new(random_num: 77, initial_lives: 2) }

  describe '#won?' do
    it 'is true when you guess the correct number' do
      game.take_turn(77)

      expect(game.won?).to be true
    end

    context 'when a player has not won' do
      context 'has lives left' do
        context 'player has not guessed secret' do
          it 'game is in progress' do
            game.take_turn(33)

            expect(game.won?).to be false
          end
        end
      end
    end
  end

  describe '#lost?' do
    it 'is true when player has ran out of lives' do
      # make 2 incorrect guesses
      game.take_turn(3)
      game.take_turn(6)

      expect(game.lost?).to be true
    end

    it 'is false when the game is in progress' do
      # you have not taken any turns then the saved guess array will be empty and thus not equal to initial lives
      expect(game.saved_guess).to be_empty
    end
  end

  describe '#over?' do
    it 'is over when all lives are lost' do
      game.take_turn(3)
      game.take_turn(9)

      expect(game.over?).to be true
    end

    it 'is over when correct number is guessed' do
      game.take_turn(77)

      expect(game.over?).to be true
    end

    context 'when the game is not over' do
      it 'number has not been guessed and there are lives left' do
        expect(game.over?).to be false
      end
    end
  end

  describe '#valid_guess?' do
    it 'is valid when the guess is between 0 - 100.' do
      expect(game.valid_guess?(77)).to be true
    end

    it 'is not valid when the guess is <0 and >100.' do
      expect(game.valid_guess?(102)).to be false
    end

    describe '#lives_left' do
      it 'equal intial lives minus the length of the guess' do
        game.take_turn(3)

        expect(game.lives_left).to equal(1)
      end
    end
  end

  describe '#take_turn' do
    let(:guess) { Game.new(88, initial_lives: 2) }

    context 'When a player makes a guess' do
      context 'records all the guesses' do
        it 'saves the guess to the guess array' do
          game.take_turn(44)

          expect(game.saved_guess.include?(44)).to be true
        end
      end

      context 'determins whether output is positive or negative' do
        it 'Guess is less than random_num returns neg num ' do
          game.take_turn(33)

          expect(game.take_turn(33)).to be_negative
        end

        it 'Guess is greater than random_num return a pos num' do
          game.take_turn(99)

          expect(game.take_turn(99)).to be_positive
        end

        it 'Guessed correct number return zero' do
          game.take_turn(77)

          expect(game.take_turn(77)).to eq(0)
        end
      end
    end
  end
end

#   it 'returns a negative number if the guess is to high'
#   game.take_turn(99)

#   expect(game.saved_guess).to all(be < 0)
# end

#     it 'returns a zero when the right asnwer is guessed'
#   end
# end
