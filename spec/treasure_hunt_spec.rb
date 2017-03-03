# spec/treasurehnt_spec.rb
require "treasure_hunt"

describe TreasureHunt do
  describe ".initialise" do
    context "given Treasure Hunt game is started" do
    game = TreasureHunt.new
      it "there is a Board" do
        expect(game.board).to be_an_instance_of(Board)
      end
      it "there is a Treasure" do
        expect(game.treasure).to be_an_instance_of(Treasure)
      end
      it "the Treasure is hidden in the Board" do
        expect(game.board.squares.flatten.include?(1)).to eql(true)
      end
    end
  end
end

describe Board do
  describe ".initialise" do
    context "given there is a Board" do
      board = Board.new
      it "has 10x10 squares" do
        expect(board.squares.count * board.squares[0].count).to eql(10 * 10)
      end
    end
  end
end

describe Treasure do
  describe ".initialise" do
    context "given there is a treasure" do
      treasure = Treasure.new
      it "the Treasure has a x axis position between 0 and 9" do
        expect(treasure.horizontal_position).to be_between(0, 9)
      end
      it "the Treasure has a y axis position between 0 and 9" do
        expect(treasure.vertical_position).to be_between(0, 9)
      end
    end
  end
  describe ".placed_at?" do
    context "given there is a treasure placed at x:1 and y:1" do
      located_treasure = Treasure.new(1,1)
      it "returns 'Success' when I guess that is placed_at x:1 and y:1" do
        expect(located_treasure.placed_at?(1,1))
        .to eql('Success')
      end
      it "returns 'Hot' when I guess that is placed 1 horizontal square away" do
        expect(located_treasure.placed_at?(0,1))
        .to eql('Hot')
      end
      it "returns 'Hot' when I guess that is placed 1 vertical square away" do
        expect(located_treasure.placed_at?(1,2))
        .to eql('Hot')
      end
      it "returns 'Warm' when I guess that is placed 2 horizontal squares away" do
        expect(located_treasure.placed_at?(1,3))
        .to eql('Warm')
      end
      it "returns 'Warm' when I guess that is placed 2 vertical and 2 horizontal squares away" do
        expect(located_treasure.placed_at?(3,3))
        .to eql('Warm')
      end
      it "returns 'Cold' when I guess that is placed 3 or more squares away" do
        expect(located_treasure.placed_at?(rand(4..9),rand(4..9)))
        .to eql('Cold')
      end
    end
  end
end
