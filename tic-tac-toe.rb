#A turn-based two-player tic-tac-toe to be played on the command line.


class Board
  attr_accessor :row1, :row2, :row3, :board_rows, :winning_rows

  def initialize
    @row1 = Row.new("A")
    @row2 = Row.new("B")
    @row3 = Row.new("C")
    @board_rows = [@row1, @row2, @row3]
    @winning_rows = [[@row1.row[0], @row2.row[0], @row3.row[0]],  #vertical straights
                    [@row1.row[1], @row2.row[1], @row3.row[1]],
                    [@row1.row[2], @row2.row[2], @row3.row[2]],
                    [@row1.row[0], @row1.row[1], @row1.row[2]],   #horizontal straights
                    [@row2.row[0], @row2.row[1], @row2.row[2]],
                    [@row3.row[0], @row3.row[1], @row3.row[2]],
                    [@row1.row[0], @row2.row[1], @row3.row[2]],   #diagonal straights
                    [@row3.row[0], @row2.row[1], @row1.row[2]]]
  end

  def make_a_move(player)
    while true do
      @symbol = player.symbol
      @move = gets.chomp.upcase.split("")
      @row = @move[0]
      @column = @move[1].to_i

      if (@row != "A" && @row != "B" && @row != "C") || (@column < 1 && @column > 3)
        print "Illegal move! Try again > "
      elsif @row == "A"
        if @board_rows[0].legal_move?(@column)
          @board_rows[0].modify_column(@column, @symbol)
          break
        else
          print "Illegal move! Try again > "
        end
      elsif @row == "B"
        if @board_rows[1].legal_move?(@column)
          @board_rows[1].modify_column(@column, @symbol)
          break
        else
          print "Illegal move! Try again > "
        end
      elsif @row == "C"
        if @board_rows[2].legal_move?(@column)
          @board_rows[2].modify_column(@column, @symbol)
          break
        else
          print "Illegal move! Try again > "
        end
      end
    end
    update_winning_rows
  end

  def update_winning_rows
    @winning_rows = [[@row1.row[0], @row2.row[0], @row3.row[0]],  #vertical straights
                    [@row1.row[1], @row2.row[1], @row3.row[1]],
                    [@row1.row[2], @row2.row[2], @row3.row[2]],
                    [@row1.row[0], @row1.row[1], @row1.row[2]],   #horizontal straights
                    [@row2.row[0], @row2.row[1], @row2.row[2]],
                    [@row3.row[0], @row3.row[1], @row3.row[2]],
                    [@row1.row[0], @row2.row[1], @row3.row[2]],   #diagonal straights
                    [@row3.row[0], @row2.row[1], @row1.row[2]]]
  end

  def victory? (player)
    @victory = false
    @symbol = player.symbol
    @winning_rows.any? do |row|
      if row[0] == "[#{@symbol}]" && row[1] == "[#{@symbol}]" && row[2] == "[#{@symbol}]"
        @victory = true
      else
        @victory = false
      end
    end
    @victory
  end

  def tie?
    if @board_rows.all? {|row| row.row_full? }
      true
    else
      false
    end
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

  def row_full?
    if @row.all? { |slot| slot != "[ ]" }
      true
    else
      false
    end
  end

  def column_within_range? (index)
    if index >= 1 && index <= 3
      true
    else
      false
    end
  end

  def legal_move? (index)
    column_free?(index) && column_within_range?(index) ? true : false
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

#########################
#########################
##Constructing the game##
#########################
#########################
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

  if board.victory?(player_in_turn)
    puts "Victory for #{player_in_turn.name}!"
    break
  elsif board.tie?
    puts "It's a tie."
    break
  end
  puts ""
  i+=1
end
