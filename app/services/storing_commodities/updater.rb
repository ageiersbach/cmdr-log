module StoringCommodities
  class Updater
    def initialize(params)
      @fields = StoringCommodities::Fields.new(params)
    end

    def errors
      @fields.errors
    end

    def valid?
      validate_amount
      @fields.valid?
    end

    def total_profit
      return 0 unless valid?
      per_unit? ? @fields.amount * @fields.sell_price : @fields.sell_price
    end

    def new_balance(balance=0)
      balance += total_profit
    end

    def update
      return unless valid?
      stored_commodities.update_all(ship_id: nil, sell_price: price_per_unit)
    end

    private

    def price_per_unit
      per_unit? ? @fields.sell_price : @fields.sell_price / @fields.amount
    end

    def per_unit?
      @fields.sell_as == :per_unit
    end

    def validate_amount
      amount = stored_commodities.to_a.size
      if amount < @fields.amount
        @fields.errors[:amount] << "must be between 1 and #{amount}"
      end
    end

    def stored_commodities
      @stored_commodities ||=
        StoredCommodity.where(
          commodity_id: @fields.commodity_id,
          ship_id: @fields.ship_id
        ).limit(@fields.amount)
    end
  end
end
