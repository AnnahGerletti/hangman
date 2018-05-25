require_relative '../highlow_refactor'

RSpec.describe Game do
  let(:game) { Game.new(77) }

  describe "#won?" do
    it 'is true when you guess the correct number' do 
      game.take_turn(77)

      expect(game.won?).to be_truthy
    end

    it 'is false when the game is in progress' do 
      game.take_turn(33)

      expect(game.won?).to be_falsey
    end
  end
  
  describe '#lost?' do
    it 'is true when player has ran out of lives' do
      
      #make 6 incorrect guesses
      game.take_turn(3)
      game.take_turn(3)
      game.take_turn(3)
      game.take_turn(3)
      game.take_turn(3)
      game.take_turn(3)

      expect(game.lost?).to be_truthy
    end
    
    it 'is false when there is at least one life left or when no turns have been taken' do
      
      # game.take_turn(3)
      # game.take_turn(3)
      # game.take_turn(3)
      # game.take_turn(3)
      # game.take_turn(3)
      
      expect(game.saved_guess).to be_empty
      # if you have not taken any turns then the saved guess array will be empty and thus not equal to initial lives 
    end
  end

  describe "#over?" do
    it 'is over when all lives are lost' do

      game.take_turn(3)
      game.take_turn(9)
      game.take_turn(8)
      game.take_turn(7)
      game.take_turn(6)
      game.take_turn(5)

      expect(game.over?).to be_truthy
    end

    it 'is over when correct number is guessed' do

      game.take_turn(77)

      expect(game.over?).to be_truthy
    end

    it 'is not over when number has not been guessed and there are lives left' do

      expect(game.over?).to be_falsey
    end
  end

  describe '#valid_guess?' do 
    it 'is valid when the guess is between 0 - 100.' do

      expect(game.valid_guess?(77)).to be_truthy
    end

    it 'is not valid when the guess is <0 and >100.' do 
      
      expect(game.valid_guess?(102)).to be_falsey
    end

    describe '#lives_left' do
      it 'equal intial lives minus the length of the guess' do 
        game.take_turn(3)

        expect(game.lives_left).to equal(5)
      end
    end
  end 

    describe '#take_turn' do
      let(:guess) {Game.new(88)}
      it 'decreases lives when it is a wrong guess' do
        game.take_turn(44)

        expect(game.lives_left).to equal(5)
      end

      it 'adds a guess to the saved guesses' do
        game.take_turn(44)

        expect(game.saved_guess).to include(44)
      end

      it 'returns a positive number if the guess it to low' do
        game.take_turn(3)

        expect(game.saved_guess - guess).to be > 0
      end


      # it 'returns a negative number if the guess is to high'do
      #   game.take_turn(99)

      #   expect(game.saved_guess).to all(be < 0)
      # end

      it 'returns a zero when the right asnwer is guessed'
    end
  end
