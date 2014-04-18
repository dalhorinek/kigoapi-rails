module KigoAPI
    class PricePeriod::NightAmount
        attr_accessor :guests_from
        attr_accessor :week_nights

        attr_reader :stay_from

        def initialize
            @stay_from = { :UNIT => :NIGHT, :NUMBER => 1 }
            @amount = PricePeriod::NightAmount::Amount.new(0)
        end

        def amount
            @amount
        end

        def amount=(number)
            @amount.set number
        end

        def as_json(options={})
            {
                :GUESTS_FROM => @guests_from,
                :WEEK_NIGHTS => @week_nights,
                :STAY_FROM => @stay_from.as_json,
                :amount => @amount.to_s
            }
        end
    end

    class PricePeriod::NightAmount::Amount
        def initialize(number)
            @number = number
        end

        def set(value)
            @number = value
        end

        def to_f
            @number
        end

        def to_s
            "#{@number}.00"
        end
    end
end