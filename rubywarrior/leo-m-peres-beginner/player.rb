require 'pry'

class Player
  # Constants declarations:
  MAX_HEALTH = 20
  HEALTHY = 16
  HALF_HEALTH = 10
  MIN_HEALTH = 7

  # Initialize instance variables.
  def initialize
    @health = MAX_HEALTH
    @direction = :forward
  end

  def play_turn(warrior)

    # Check if the warrior is under archer attack.
    archer_attack = warrior.health < @health

    if warrior.feel(@direction).empty? || warrior.feel(@direction).wall?

      # Keep the warrior health up.
      if warrior.health >= HEALTHY || archer_attack
        warrior.feel(@direction).wall? ? warrior.pivot! : warrior.walk!(@direction)
      else
        warrior.rest!
      end

    else

      rescue_or_attack(warrior)

    end
    # binding.pry

    @health = warrior.health
  end

  private

  def hit_back_the_wall?(warrior)
    warrior.pivot! if warrior.feel(@direction).wall?
  end

  # Use +warrior.feel.captive?+ to see if there is a captive and
  # +warrior.rescue!+ to rescue him. Don't attack captives.
  def rescue_or_attack(warrior)
    if warrior.feel(@direction).captive?
      warrior.rescue! @direction
      @direction = :forward
    else
      warrior.attack! @direction
      @direction = :backward if need_rest?(warrior)
    end
  end

  def need_rest?(warrior)
    warrior.health <= HALF_HEALTH
  end

  # Prints a log of variables on console.
  def console_log(warrior)
    puts "@health = #{@health}"
    puts "@direction = #{@direction}"
    puts "warrior.health = #{warrior.health}"
    puts "warrior.feel = #{warrior.feel}"
    puts "warrior.feel(:#{@direction}) = #{warrior.feel(@direction)}"
    puts "warrior.feel.empty? = #{warrior.feel.empty?}"
    print "warrior.feel.captive? = #{warrior.feel.captive?}\n\n"
  end
end
