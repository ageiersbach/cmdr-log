class Eddb
  include HTTParty
  base_uri "eddb.io"

  def self.systems
    self.get("/archive/v4/systems.json")
  end
end
