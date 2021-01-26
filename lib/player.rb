require 'bundler'
require 'pry'
Bundler.require

class Player
  attr_accessor :name
  attr_accessor :life
  @@all_player = Array.new

  def initialize(name)
    @name = name
    @life = 10
    @@all_player << self
  end

  def self.all
    return @@all_player
  end

  def show_state
    puts "#{@name} a #{@life} points de vie"
  end

  def gets_damage(damage)
    @life -= damage
    if @life <= 0
      puts "#{@name} s'est crashé!"
    else show_state
    end
  end

  def attacks(opponent)
    puts "#{@name}, attaque l'avion #{opponent.name}"
    damaged = opponent.gets_damage(compute_damage)
  end

  def compute_damage
    return rand(1..6)
  end

end