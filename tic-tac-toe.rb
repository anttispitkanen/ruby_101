#A turn-based two-player tic-tac-toe to be played on the command line.


class Board
  attr_accessor :row1, :row2, :row3, :board_rows

  def initialize
    @row1 = Row.new("A")
    @row2 = Row.new("B")
    @row3 = Row.new("C")
    @board_rows = [@row1, @row2, @row3]
  end

  def make_a_move(player)
    @symbol = player.symbol
    @move = gets.chomp.upcase.split("")
    @row = @move[0]
    #puts "row :#{@row}"
    if @row != "A" && @row != "B" && @row != "C"
      out_of_range
    end
    @column = @move[1].to_i
    if @column < 1 || @column > 3
      out_of_range
    end
    #puts "column: #{@column}"

    if @row == "A"
      @board_rows[0].modify_column(@column, @symbol)
    elsif @row == "B"
      @board_rows[1].modify_column(@column, @symbol)
    elsif @row == "C"
      @board_rows[2].modify_column(@column, @symbol)
    end
  end

  def out_of_range
    puts "Out of range! \n\n"
  end

  def print_board
    puts "   1  2  3"
    @board_rows.each {|row| row.print_row}
  end
end


class Row
  attr_accessor :letter, :row

  def initialize (letter)
    @letter = letter
    @row = ["[ ]", "[ ]", "[ ]"]
  end

  def column_free? (index) #choosing from 1-3 so index-1
    @row[index-1] == "[ ]" ? true : false
  end

  def modify_column (index, symbol) #choosing from 1-3 so index-1
    @row[index-1] = "[#{symbol}]"
  end

  def print_row
    print "#{@letter} "
    @row.each {|x| print x}
    print "\n"
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

player1 = Player.new("Player 1", "X")
player2 = Player.new("Player 2", "O")

board = Board.new
board.print_board
puts ""

i=1
while true do
  player_in_turn = player1
  i % 2 == 0 ? player_in_turn = player2 : player_in_turn = player1

  print "#{player_in_turn.name} make a move > "
  board.make_a_move(player_in_turn)
  board.print_board
  puts ""
  i+=1
end

#i = gets.chomp.upcase.split("")
#puts i

#print game.row

#puts "   1  2  3"
#puts "A "+"[ ][ ][ ]"
#puts "B "+"[ ][O][X]"
#puts "C "+"[X][ ][ ]"
