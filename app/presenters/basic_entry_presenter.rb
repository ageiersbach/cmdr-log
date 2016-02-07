class BasicEntryPresenter
  attr_reader :entry
  def initialize(entry)
    @entry = entry
  end

  def date
    year = entry.created_at.year + 1286
    mday = entry.created_at.strftime('%e %b')
    "#{mday} #{year}"
  end
end
