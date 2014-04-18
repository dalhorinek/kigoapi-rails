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

        def as_json
            {
                :TYPE => @type,
                :STANDARD => @standard,
                :MAX => @max
            }
        end
    end
end