require_relative '../classes/game'
require_relative '../classes/item'

describe Game do
  context 'Testing Game class' do
    before :each do
      @game = Game.new('yes', '2019-01-01', '1999-01-01')
    end

    it 'test if game is an instance of Game' do
      expect(@game).to be_a Game
    end

    it 'test if game is an instance of Item' do
      expect(@game).to be_a Item
    end

    it 'test if a game can be archived' do
      expect(@game.can_be_archived?).to be true
    end

    it 'test if a game can be archived returns false' do
      @game_two = Game.new('yes', '2020-01-01', '2021-01-01')
      expect(@game_two.can_be_archived?).to be false
    end
  end
end
