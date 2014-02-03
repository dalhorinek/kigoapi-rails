module KigoAPI
    class Rent
        attr_accessor :periods

        attr_reader :per_guest_charge

        def initialize
            @periods = []
        end

        def set_per_guest_charge(type, standard, max)
            per_guest = KigoAPI::PerGuestCharge.new
            per_guest.type = type 
            per_guest.standard = standard
            per_guest.max = max 

            @perguest_charge = per_guest
        end

        def add_period(period)
            @periods.push period
        end

        def to_json 
            {
                :periods => @periods, 
                :perguest_charge => @perguest_charge
            }.to_json
        end
    end
end