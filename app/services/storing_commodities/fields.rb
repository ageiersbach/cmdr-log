module StoringCommodities
  # this exists to:
  #   1) format incoming params appropriately
  #   2) store an error [] for each field
  class Fields
    def initialize(params)
      @params = params
      @errors = new_errors_hash
      validate_fields
    end

    def amount
      nil_or_int_from(@params[:amount])
    end

    def commodity_id
      nil_or_int_from(@params[:commodity_id])
    end

    def ship_id
      nil_or_int_from(@params[:ship_id])
    end

    def sell_as
      [:per_unit, :total].find {|o| o == @params[:sell_as].to_sym}
    end

    def sell_price
      nil_or_int_from(@params[:sell_price])
    end

    def errors
      @errors
    end

    def valid?
      @errors.all?{|k,v| v.empty? }
    end

    private

    def nil_or_int_from(str)
      str.blank? ? nil : str.to_i
    end

    def new_errors_hash
      new_errors = {}
      fields.each {|f| new_errors[f] = [] }
      new_errors
    end

    def fields
      [ :amount, :commodity_id, :sell_as, :sell_price, :ship_id ]
    end

    def validate_fields
      [:commodity_id, :sell_as, :ship_id].each do |f|
        if self.send(f).nil?
          errors[f] << "cannot be blank"
        end
      end

      [:amount, :sell_price].each do |f|
        if self.send(f) <= 0
          errors[f] << "must be greater than 0"
        end
      end
    end
  end
end
