class SystemImportJob
  @queue = :system_queue

  def self.perform
    ActiveRecord::Base.clear_active_connections!

    Eddb.systems.each do |system|
      System.where(name: system["name"], x: system["x"], y: system["y"], z: system["z"]).first_or_create!
    end
  end
end
