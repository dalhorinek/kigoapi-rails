module KigoAPI
    class BookingSources
        def self.list
            @@bookings_sources ||= fetch
        end

        def self.find(id)
            self.list.each do |i|
                if i.id == id
                    return i
                end
            end

            return nil
        end

        private
        def self.fetch
            response = KigoAPI::Client.post("listBookingSources", nil)

            result = []

            unless response.data
                return result
            end

            response.data.each do |item|
                result.push KigoAPI::BookingSource.new(item)
            end

            result
        end
    end
end
