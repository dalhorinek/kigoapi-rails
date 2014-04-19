module KigoAPI
    class PricingSetup
        attr_accessor :prop_id
        attr_accessor :rent
    end

    def initialize
    end

    def set_rent(rent)
        self.rent = rent
    end

    def as_json
        {
            :PROP_ID => self.prop_id,
            :PRICING => {
                :RENT => rent
            }
        }
    end
end