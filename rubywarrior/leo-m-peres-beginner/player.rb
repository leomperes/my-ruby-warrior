class Player
  MAX_HEALTH = 20

  def play_turn(warrior)
    if warrior.feel.empty?
      warrior.health < MAX_HEALTH ? warrior.rest! : warrior.walk!
    else
      warrior.attack!
    end
  end
end
