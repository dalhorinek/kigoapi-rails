module KigoAPI
    class PricingSetup
        attr_accessor :prop_id
        attr_accessor :rent

        def set_rent(rent)
            @rent = rent
        end

        def as_json(options=nil)
            {
                :PROP_ID => @prop_id,
                :PRICING => {
                    :RENT => @rent
                }
            }
        end
    end
end