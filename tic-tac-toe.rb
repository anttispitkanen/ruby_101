#A turn-based two-player tic-tac-toe to be played on the command line.

=begin
class Board
  attr_accessor :row1, :row2, :row3

  def initialize
    @row1 = Row.new
    @row2 = Row.new
    @row3 = Row.new
  end


end
=end

class Row
  attr_accessor :row

  def initialize
    @row = ["[ ]", "[ ]", "[ ]"]
  end

  def choose (index)

  end

end

class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end
#class Element

#end

game = Row.new
game.row.each {|x| print x}
#print game.row

#puts "   1  2  3"
#puts "A "+"[ ][ ][ ]"
#puts "B "+"[ ][O][X]"
#puts "C "+"[X][ ][ ]"
