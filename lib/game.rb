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
    end
end