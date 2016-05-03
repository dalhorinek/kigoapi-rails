module KigoAPI
    class Reservation::Booking
        attr_accessor :state
        attr_accessor :state_date
        attr_accessor :amount
        attr_accessor :currency
        attr_accessor :engine_code
        attr_accessor :ref

        def initialize(data)
            if data
                data.keys.each do |key|
                    prop = key.to_s.downcase.gsub(/^ob_(.*)/, '\1')

                    method = "#{prop}="

                    if self.respond_to? method
                        self.send method, data[key]
                    end
                end
            end
        end

        def as_json
            {
                :OB_STATE => self.state,
                :OB_STATE_DATE => self.state_date,
                :OB_AMOUNT => self.amount,
                :OB_CURRENCY => self.currency,
                :OB_ENGINE_CODE => self.engine_code,
                :OB_REF => self.ref
            }
        end
    end
end
