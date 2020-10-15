class Game
  attr_accessor :current_player , :status , :board , :players 
  
  def initialize(name1,name2)
    player1 = Player.new(name1,"X")
    player2 = Player.new(name2,"O")
    @players = [player1,player2]
    @status = "on going"
    @board = Board.new
    @current_player = @players[0]
  end

  def turn
    puts
    Display.new.display_board(@board.table)
    @board.play_turn(@current_player)
    @board.count_turn += 1
    
    if @board.victory == true
      @status = @current_player
    elsif @board.count_turn == 9
      @status = "nul"
    else
      @status = "on going"
    end
    
    if @current_player == @players[0]
      @current_player = @players[1]
    else
      @current_player = @players[0]
    end
  end

  def new_round
    @board = Board.new
    @status = "on going"
  end
end
