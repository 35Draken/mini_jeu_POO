require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#-----------Accueil
puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"
#-----------Init_Player
puts " Quel ton prénom Maverick?"
print ">"
Maverick = HumanPlayer.new("#{gets.chomp}")
#-----------Enemies
Airbus = Player.new("AirbusA380")
Boeing = Player.new("Boeing737Max")






binding.pry