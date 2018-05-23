require_relative '../highlow_refactor'

RSpec.describe Game do
  describe "#won?" do
    it 'is true when you guess the correct number' do 
      game = Game.new(44)
      game.take_turn(44)

      expect(game.won?).to be_truthy
    end

    it 'is false when the game is in progress' do 
      game = Game.new(44)
      game.take_turn(33)

      expect(game.won?).to be_falsey
    end
  end
  
  describe '#lost?' do
    it 'is true when player has ran out of lives' do
      game = Game.new(6)
      
      #make 6 incorrect guesses
      game.take_turn(3)
      game.take_turn(3)
      game.take_turn(3)
      game.take_turn(3)
      game.take_turn(3)
      game.take_turn(3)

      expect(game.lost?).to be_truthy
    end

    it 'is false when there at least one life left' do
      game = Game.new(44)

      game.take_turn(3)
      game.take_turn(3)
      game.take_turn(3)
      game.take_turn(3)
      game.take_turn(3)

      expect(game.lost?).to be_falsey
    end
  end

  describe "#over?" do
    it 'is over when all lives are lost'

    it 'is over when correct number is guessed'

    it 'is not over when number has not been guessed and there are lives left'



  end
end