class Application
  def perform
    puts "Bienvenue dans le jeu du morpion, j'espère que vous connaissez les règles parce que je ne vais pas les expliquer."
    puts "Par contre il va me falloir vos noms :"
    print "Celui du joueur 1 : > "
    joueur1 = gets.chomp
    print "Et celui du joueur 2 : > "
    joueur2 = gets.chomp

    game = Game.new(joueur1,joueur2)

    while game.status == "on going"
      game.turn
    end
    Display.new.display_board(game.board.table)
    if game.status == "nul"
      puts "C'est un match nul"
    else
      puts "Le joueur #{game.status.name} a gagné !"
    end
    puts "La partie est terminée !"
    puts "Si vous voulez en refaire une autre avec les même joueurs, vous pouvez écrire 'Encore !' sinon le jeu sera quitté"
    print "> "
    answer = gets.chomp
    while answer == "Encore !"
      game.new_round
      while game.status == "on going"
        game.turn
      end
      puts
      Display.new.display_board(game.board.table)
      if game.status == "nul"
        puts
        puts "C'est un match nul"
      else
        puts
        puts "Le joueur #{game.status.name} a gagné !"
      end
      puts "La partie est terminée !"
      puts "Si vous voulez en refaire une autre avec les même joueurs, vous pouvez écrire 'Encore !' sinon le jeu sera quitté"
      print "> "
      answer = gets.chomp
    end
    puts "Merci d'avoir joué !"
  end
end