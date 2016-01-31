#TODO: NEEDS REFACTOR
class StoredCommoditiesUpdater
  Params = Struct.new(:commodity_id, :amount, :sell_price, :sell_as, :ship_id)
  Errors = Struct.new(:commodity_id, :amount, :sell_price, :sell_as, :ship_id) do
    def initialize
      self.commodity_id = []
      self.amount = []
      self.sell_price = []
      self.sell_as = []
      self.ship_id = []
    end

    def empty?
      self.commodity_id.empty? &&
       self.amount.empty? &&
       self.sell_price.empty? &&
       self.sell_as.empty? &&
       self.ship_id.empty?
    end
  end

# usage
# stored_commodities_updater = StoredCommoditiesUpdater.new
  # if stored_commodities_updater.update
#   current_commander.balance += stored_commodities_updater.total_profit
#   render '/ships/_cargo'

  def initialize(params)
    @params = accept_params(params)
    @errors = Errors.new
  end

  def update
    if valid?
      stored_commodities.update_all(ship_id: nil, sell_price: price)
    end
  end

  def valid?
    validate_params
    validate_amount
    @errors.empty?
  end

  def total_profit
    if valid?
      @params.sell_as == :total ? @params.sell_price : @params.sell_price * @params.amount
    else
      0
    end
  end

  def errors
    @errors
  end

  private

  def validate_amount
    unless (0..stored_commodities.count).cover?(@params.amount)
      @errors[:amount] << "must be between 0 and #{stored_commodities.count}"
    end
  end

  def validate_params
    [:ship_id, :commodity_id, :amount, :sell_price, :sell_as].each do |req_field|
      if @params[req_field].nil?
        @errors[req_field] << "cannot be blank"
      end
    end
  end

  def stored_commodities
    @stored_commodities ||=
      StoredCommodity.where(
        commodity_id: @params.commodity_id,
        ship_id: @params.ship_id
      ).limit(@params.amount)
  end

  def price
    if @params.sell_as == :per_unit
      @params.sell_price
    elsif @params.sell_as == :total
      @params.sell_price / @params.amount
    end
  end


  def accept_params(params)
    params_struct = Params.new
    params_struct.commodity_id = nil_or_int(params[:commodity_id])
    params_struct.amount = nil_or_int(params[:amount])
    params_struct.sell_price = nil_or_int(params[:sell_price])
    params_struct.sell_as = sell_as(params[:sell_as].to_sym)
    params_struct.ship_id = nil_or_int(params[:ship_id])
    params_struct
  end

  def sell_as(option)
    [:per_unit, :total].find {|o| o == option}
  end

  def nil_or_int(value)
    value.blank? ? nil : value.to_i
  end
end
