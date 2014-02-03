module KigoAPI
    class PricePeriod::NightAmount
        attr_accessor :guests_from 
        attr_accessor :week_nights

        attr_reader :stay_from 

        def initialize
            @stay_from = { unit: :night, number: 1 }
        end

        def amount 
            @amount
        end 

        def amount=(number)
            @amount = PricePeriod::NightAmount::Amount.new(number)
        end

        def as_json(options={})
            {
                :stay_from => @stay_from.as_json, 
                :week_nights => @week_nights, 
                :amount => @amount.to_s,
                :guests_from => @guests_from
            }
        end
    end

    class PricePeriod::NightAmount::Amount
        def initialize(number)
            @number = number
        end

        def to_f
            @number 
        end

        def to_s 
            "#{@number}.00"
        end
    end
end