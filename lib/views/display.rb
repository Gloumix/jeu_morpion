class Display
  def display_board(board)
    puts "   1   2   3 "
    puts "A  #{board[0]} | #{board[1]} | #{board[2]} "
    puts "  -----------"
    puts "B  #{board[3]} | #{board[4]} | #{board[5]} "
    puts "  -----------"
    puts "C  #{board[6]} | #{board[7]} | #{board[8]} "
  end
end


