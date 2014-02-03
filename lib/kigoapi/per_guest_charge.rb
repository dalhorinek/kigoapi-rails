module KigoAPI
    class PerGuestCharge
        attr_reader :type 
        attr_accessor :standard
        attr_accessor :max


        def type=(unit)
            if [:adults, :adults_children, :adults_children_babies].include?(unit)
                @type = unit 
            else
                raise ArgumentError, "Invalid type (Available :adults, :adults_children, :adults_children_babies)"
            end
        end

        def to_json 
            {
                :type => @type, 
                :standard => @standard, 
                :max => @max
            }.to_json
        end
    end
end