module StoringCommodities
  def self.updater(params)
    puts "StoringCommodities.updater called"
    StoringCommodities::Updater.new(params)
  end
end
