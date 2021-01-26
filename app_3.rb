require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

    puts "------------------------------------------------"
    puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
    puts "|        Devenez l'Ace du ciel !                |"
    puts "-------------------------------------------------"

    puts "\n Quel est ton nom ?"
    print "> "
    user_name = gets.chomp
    print "\n"
    my_game = Game.new(user_name)


binding.pry