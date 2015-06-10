module KigoAPI
    class Reservation::Payment
        attr_accessor :rentdown_due
        attr_accessor :rentdown_due_date
        attr_accessor :rentdown_paid
        attr_accessor :rentdown_paid_date
        attr_accessor :rentdown_method
        attr_accessor :rentremaining_due
        attr_accessor :rentremaining_due_date
        attr_accessor :deposit_due
        attr_accessor :deposit_due_date
        attr_accessor :deposit_paid
        attr_accessor :deposit_paid_date
        attr_accessor :deposit_method

        def initialize(data)
            if data
                data.keys.each do |key| 
                    prop = key.to_s.downcase

                    method = "#{prop}="

                    if self.respond_to? method
                        self.send method, data[key]
                    end
                end
            end
        end
    end
end