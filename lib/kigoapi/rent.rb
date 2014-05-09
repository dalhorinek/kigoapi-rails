module KigoAPI
    class Rent
        attr_accessor :periods

        attr_reader :per_guest_charge

        def initialize
            @periods = []
        end

        # @param type       One of [ :adults, :adults_children, :adults_children_babies ]
        # @param standard   Standard occupancy
        # @param extra      Extra beds
        def set_per_guest_charge(type, standard, max)
            per_guest = KigoAPI::PerGuestCharge.new
            per_guest.type = type
            per_guest.standard = standard
            per_guest.max = max

            @per_guest_charge = per_guest
        end

        def add_period(period)
            @periods.push period
        end

        def as_json(options=nil)
            {
                :PERGUEST_CHARGE => @per_guest_charge,
                :PERIODS => @periods
            }
        end
    end
end