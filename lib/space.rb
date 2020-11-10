class Space

  def self.all
    @lairs = ["Batcave", "Moonraker", "Ice hotel"]
  end

  def self.add(name)
     name = "Deathstar"
     @lairs << name
  end

end
