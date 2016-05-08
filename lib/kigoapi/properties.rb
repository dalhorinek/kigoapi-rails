module KigoAPI
    class Properties
        def self.list
            response = KigoAPI::Client.post("listProperties2", nil)

            unless response.data
                raise "Cannot receive property list"
            else
                response.data.map do |prop|
                    KigoAPI::Property.new(prop[:PROP_ID])
                end
            end
        end

        def self.get(id)
            KigoAPI::Property.new(id)
        end

        def self.load(id)
            response = KigoAPI::Client.post("readProperty2", { :PROP_ID => id })

            unless response.data
                raise 'No such property'
            end

            response.data
        end
    end
end
