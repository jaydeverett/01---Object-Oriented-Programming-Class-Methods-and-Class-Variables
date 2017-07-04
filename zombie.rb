class Zombie

  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  def initialize(speed, strength)
    @speed = speed
    @strength = strength

    if speed > @@max_speed
      speed = @@default_speed
    end
    if strength <= @@max_strength
      strength = @@default_strength
    end
  end

  def encounter

  end

  def outrun_zombie?

  end

  def survive_attack?

  end

  def self.all
    return @@horde
  end

  def self.new_day

  end

  def self.some_die_off

  end

  def self.spawn
    number_of_zombies = rand(0..@@plague_level)
    number_of_zombies = number_of_zombies.to_i
    new_zombies = *[0..number_of_zombies]
    new_zombies.each do
        @@horde += 1
        @speed = rand(0..@@max_speed)
        @strength = rand(0..@@max_strength)
      end
  end

  def self.increase_plague_level

  end

end
