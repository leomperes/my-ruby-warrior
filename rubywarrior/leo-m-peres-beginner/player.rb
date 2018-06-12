require 'pry'

class Player
  # Constants declarations:
  MAX_HEALTH = 20

  # Initialize instance variables.
  def initialize
    @health = MAX_HEALTH
  end

  def play_turn(warrior)

    archer_attack = warrior.health < @health

    if warrior.feel.empty?

      if warrior.health >= MAX_HEALTH || archer_attack
        warrior.walk!
      else
        warrior.rest!
      end

    else
      warrior.attack!
    end
    # binding.pry

    @health = warrior.health
  end
end
