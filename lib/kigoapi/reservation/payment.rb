module KigoAPI
    class Reservation::Payment
        attr_accessor :rentdown_due
        attr_accessor :rentdown_due_date

        def initialize(data)
            if data
            	@rentdown_due = data[:RENTDOWN_DUE]
            	@rentdown_due_date = data[:RENTDOWN_DUE_DATE]
            end
        end

        def as_json(options=nil)
            {
                :PMT_RENTDOWN_DUE => self.rentdown_due,
                :PMT_RENTDOWN_DATE => self.rentdown_due_date
            }
        end
    end
end