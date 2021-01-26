require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# ------------- Attention the program is in franglais ------#
    puts "------------------------------------------------"
    puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
    puts "|        Devenez l'Ace du ciel !                |"
    puts "-------------------------------------------------"

    puts "\n Quel est ton nom ?"
    print "> "
    user_name = gets.chomp
    print "\n"
    
    my_game = Game.new(user_name)
    my_game.show_players


    while my_game.is_still_ongoing?
        my_game.menu
        my_game.menu_choice(gets.chomp)
        my_game.show_players
        my_game.enemies_attack
    end
    my_game.end 
    
binding.pry