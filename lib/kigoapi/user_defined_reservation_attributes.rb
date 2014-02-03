module KigoAPI
    class UserDefinedReservationAttributes
        def self.list 
            @@udras ||= fetch
        end

        def self.find(id)
            self.list.each do |i|
                if i.id == id 
                    return i 
                end 
            end

            return nil
        end

        def self.create(id)
            udra = self.find(id)
            udra.clone
        end

        def self.fetch 
            response = KigoAPI::Client.post("listUserDefinedReservationAttributes", nil)

            result = []

            unless response.data
                return result
            end

            response.data.each do |item|
                result.push KigoAPI::UserDefinedReservationAttribute.new(item)
            end

            result
        end

        private_class_method :fetch
    end
end