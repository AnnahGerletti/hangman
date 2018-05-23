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
  
  describe "#lost?" do
    it 'is true when length of saved_guess arr == initial lives' do
      game = Game.new
      

      expect(game.lost?).to be_truthy
    end
    it 'is false when saved_guess arr != initial lives'do
    end
  end

  describe "#over?" do
    it 'is true when lost? or won? ' do
    end
  end
end