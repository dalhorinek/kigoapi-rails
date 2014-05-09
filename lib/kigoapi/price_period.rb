module KigoAPI
    class PricePeriod
        attr_accessor :check_in
        attr_accessor :check_out
        attr_accessor :name
        attr_accessor :stay_min
        attr_accessor :weekly
        attr_accessor :weekly_amounts
        attr_accessor :nightly_amounts

        def initialize
            @nightly_amounts = []
            @weekly = false

            self.set_stay_min(:night, 1)
        end

        def set_stay_min(unit, number)
            if [:month, :night].include?(unit)
                @stay_min = { :UNIT => unit.to_s.upcase, :NUMBER => number }
            else
                raise ArgumentError, "Incorrect Unit Type"
            end
        end

        def add_night_amount(guests, amount, week_nights)
            night_amount = KigoAPI::PricePeriod::NightAmount.new

            night_amount.guests_from = guests
            night_amount.amount = amount
            night_amount.week_nights = week_nights.to_a

            @nightly_amounts.push night_amount
        end

        def as_json(options=nil)
            obj = {
                :CHECK_IN => @check_in,
                :CHECK_OUT => @check_out,
                :NAME => @name,
                :STAY_MIN => @stay_min,
                :WEEKLY => @weekly
            }

            if @weekly
                obj[:WEEKLY_AMOUNTS] = @weekly_amounts
            else
                obj[:NIGHTLY_AMOUNTS] = @nightly_amounts
            end

            obj
        end
    end
end