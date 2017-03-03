# lib/treasure_hunt.rb
class TreasureHunt
  attr_reader :treasure, :board
  def initialize
    @treasure = Treasure.new
    @board = Board.new
    @board.hide_treasure(@treasure)
    puts "Find the treasure"
    system "clear"
  end

  def play
    treasure = 'not found'
    while treasure != 'Success' do
      coordinates = getCoordinates
      treasure = @treasure.placed_at?(coordinates[:x], coordinates[:y])
      puts "tried at x: #{coordinates[:x]} y: #{coordinates[:y]}: #{treasure}\n"
    end
    puts "you are rich!!!"
    system "exit"
  end
  def getCoordinates
    print "Type the coordinate x (1..10):"
    coordinate_x = gets.chomp.to_i
    print "Type the coordinate y (1..10):"
    coordinate_y = gets.chomp.to_i
    return { x: coordinate_x, y: coordinate_y }
  end
end

class Board
  attr_reader :squares
  def initialize
    @squares = Array.new(10) { Array.new(10,0) }
  end
  def hide_treasure(treasure)
    @squares[treasure.horizontal_position][treasure.vertical_position] = 1
  end
end

class Treasure
  attr_reader :horizontal_position, :vertical_position
  def initialize(horizontal_position = rand(0..9), vertical_position = rand(0..9))
    @horizontal_position = horizontal_position
    @vertical_position = vertical_position
  end

  def placed_at?(x, y)
    if (x == @horizontal_position && y == @vertical_position)
      return 'Success'
    elsif ((@horizontal_position - x).abs <= 1 && (@vertical_position - y).abs <= 1 )
      return 'Hot'
    elsif ((@horizontal_position - x).abs <= 2 && (@vertical_position - y).abs <= 2 )
      return 'Warm'
    end
    return 'Cold'
  end
end
