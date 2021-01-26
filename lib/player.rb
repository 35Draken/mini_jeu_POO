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

class HumanPlayer < Player
  attr_accessor :weapon_level
  attr_accessor :name
  attr_accessor :life
  @@all_player = Array.new

  def initialize(name)
    super(name)
    @weapon_level = 1
    @life = 100
    @@all_player << self
  end

  def show_state
    puts "#{@name} a #{@life} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    lvl = rand(1..6)
    puts "Tu as trouve une arme de niveau #{lvl}"
    if lvl > @weapon_level
      return @weapon_level = lvl
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    case health_pack
    when 1
      "Tu n'as rien trouvé... ".
    when 2..5
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      if @life + 50 > 100 
        @life = 100 
      else
        @life += 50
      end
    else 6
      if @life + 80 > 100 
        @life = 100 
      else
        @life += 80
      end
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
end