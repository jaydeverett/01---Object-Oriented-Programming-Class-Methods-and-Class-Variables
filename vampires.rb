class Vampire

  @@vampires = []
  @@incoffin = []

  def initialize(name, age, in_coffin, drank_blood_today)
    @name = name
    @age = age
    @in_coffin = in_coffin
    @drank_blood_today = drank_blood_today
  end

  def self.create(name, age, in_coffin, drank_blood_today)
    @@vampires << Vampire.new(name, age, in_coffin, drank_blood_today)
    return @@vampires.last
  end

  def drink_blood
    @drank_blood_today = true
  end

  def self.sunrise
    if drank_blood_today == false
      @@vampires.delete(self)
    elsif in_coffin == false
      @@vampires.delete(self)
    else
      return false
    end
  end


  def sunset
    @drank_blood_today == false
    @in_coffin == false
  end

  def go_home
    in_coffin == true
  end

end
