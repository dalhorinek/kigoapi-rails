module KigoAPI
    class BookingSource
        attr_accessor :id
        attr_accessor :label

        def initialize(item)
            self.id = item["BOOKING_SOURCE_ID"]
            self.label = item["BOOKING_SOURCE_LABEL"]
        end
    end
end