require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#-----------Accueil
def start
    puts "------------------------------------------------"
    puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
    puts "|Le but du jeu est d'être le dernier survivant !|"
    puts "------------------------------------------------"
end
    #-----------Init_Player
def init_player
    puts " Quel ton prénom Maverick?"
    print ">"
    @maverick = HumanPlayer.new("#{gets.chomp}")
end
#-----------Enemies
def enemies
    @airbus = Player.new("AirbusA380")
    @boeing = Player.new("@boeing737Max")
end
#-----------Combat
def attack
    while @airbus.life > 0 && @boeing.life > 0 && @maverick.life > 0
        @maverick.attacks(@airbus && @boeing)
        if@airbus.life <= 0 || @boeing.life <= 0 || @maverick.life > 0
            break
        end
    #    @boeing.attacks(maverick)
    #   @airbus.attacks(maverick)
    end
end

def menu
    start
    init_player
    enemies
    puts "Quelle action souhaite tu effectuer?"
    puts "------------------------------------"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "------------------------------------"
    puts "attaquer un joueur en vue :"
    puts "------------------------------------"
    puts "0 - #{@airbus.show_state}"
    puts "1 - #{@boeing.show_state}"
    puts "------------------------------------"
    while @maverick.life > 0
    input = gets.chomp
    case input
    when "a"
        @maverick.search_weapon
    when "s"
        @maverick.search_health_pack
    when "0"
        @maverick.attacks(@airbus)
    when "1"
        @maverick.attacks(@boeing)
    else
        puts " APPRENDS A LIRE ZOZO"
    end
end
end
menu

binding.pry