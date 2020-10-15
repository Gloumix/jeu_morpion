class Board
  attr_accessor :table , :count_turn

  def initialize
    @count_turn = 0
    @table = [" "," "," "," "," "," "," "," "," "]
  end

  def play_turn(joueur)
    puts
    puts "A #{joueur.name} de jouer, où va-tu placer ton #{joueur.sign} ?"
    place = "11"
    while chomp_is_right(place) == false || place_is_free(place) == false  #il faut que l'input soit correcte et que la place soit libre
      print "> "
      place = gets.chomp
    end
    place_split = place.split(//)
    number = place_split[1].to_i
    number -= 1                       #informatiquement le tableau est entre (0 et 8) et non pas (1 et 9)
    letter = place_split[0]
    if letter == "A"
      letter = 0                      #correspond à la rangée 1
    elsif letter == "B"
      letter = 3                      #correspond à la rangée 2
    else letter == "C"
      letter = 6                      #correspond à la rangée 3
    end
    @table[letter+number] = joueur.sign
  end

  def victory
    win_combination = [ 
      [0,1,2], # top_row 
      [3,4,5], # middle_row 
      [6,7,8], # bottom_row 
      [0,3,6], # left_column 
      [1,4,7], # center_column 
      [2,5,8], # right_column 
      [0,4,8], # left_diagonal 
      [6,4,2] # right_diagonal 
    ]
    win_combination.each do |combination|
      position_1 = @table[combination[0]]
      position_2 = @table[combination[1]]
      position_3 = @table[combination[2]]

      if position_1 == position_2 && position_2 == position_3 && ["X","O"].include?(position_1)
      return true
      end
    end
  end



  def chomp_is_right(place)               #Pur verifier que le joueur ne mette pas n'importe quoi
    place_split = place.split(//)
    number = place_split[1].to_i
    letter = place_split[0]
    if place_split.size >2
      return false
    elsif number.between?(1,3) && ["A","B","C"].include?(letter)
      return true
    else
      return false
    end
  end

  def place_is_free(place)                  #Pour vérifier que la place est libre
    place_split = place.split(//)
    number = place_split[1].to_i
    number -= 1
    letter = place_split[0]
    if letter == "A"
      letter = 0
    elsif letter == "B"
      letter = 3
    else letter == "C"
      letter = 6
    end
    if @table[letter+number] == " "
      return true
    else 
      return false
    end
  end
end
