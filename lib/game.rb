require 'bundler'
require 'pry'

Bundler.require

class Game

    attr_accessor :human_player, :enemies

    def initialize(human_name)
        @enemies = Array.new
        @human_player = HumanPlayer.new(human_name)
        (1..4).each do |i| 
            @enemies << Player.new("bot#{i}")
        end
    end
    
    def kill_player(dead_bot)
        @enemies.each do |bot| 
            if bot.life == dead_bot
                @enemies.delete(bot.name)
            else
                break
            end
        end
        return @enemies
    end
    
    def is_still_ongoing?
        @human_player.life > 0 && !@enemies.empty? ? true : false #Empty method return a boolean if array is empty (vide)
    end

    def show_players
        @human_player.show_state
        print "\n"
        puts "#{@enemies.count} enemies rest ! \n"
    end

    def menu
        print "\n"
        puts "Quelle action souhaite tu effectuer?"
        puts "------------------------------------"
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner"
        puts "------------------------------------"
        puts "attaquer un joueur en vue :"
        i = 0
        while i < @enemies.length
            print "#{i} = #{@enemies[i].show_state}"
            i += 1
        end
        puts "------------------------------------"
        print "\n> "
    end

    def menu_choice(string)
        input = string
        case input
        when "a"
            @human_player.search_weapon
        when "s"
            @human_player.search_health_pack
        when "0"
            @human_player.attacks(@enemies[0])
            if @enemies[0].life <= 0
                kill_player(@enemies[0])
            end
        when "1"
            @human_player.attacks(@enemies[1])
            if @enemies[1].life <= 0
                kill_player(@enemies[1])
            end
        when "2"
            @human_player.attacks(@enemies[2])
            if @enemies[2].life <= 0
                kill_player(@enemies[2])
            end
        when "3"
            @human_player.attacks(@enemies[3])
            if @enemies[3].life <= 0
                kill_player(@enemies[3])
            end
        else
            puts "### APPRENDS A LIRE ZOZO ###"
        end
        print "\n"
    end

    def enemies_attack
        if is_still_ongoing? == true
            @enemies.each do |pnj| 
                pnj.attacks(@human_player)
            end
        end
    end

    def end
        puts "La partie est fini !"
        
        if @human_player.life > 0
            puts "Bravo, tu as gagné"
        else
            puts "Looser ! Tu as perdu !"
        end
    end
end