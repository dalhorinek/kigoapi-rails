module KigoAPI
    class Client
        API_HOST = "app.kigo.net/api/ra/v1/"

        def self.auth(username, password)
            @@username = username 
            @@password = password
        end


        def self.ping 
            post("ping", "ping")
        end

        def updatePropertyPricingSetup(property_id, rent)
            setup = { 
                :PROP_ID => property_id, 
                :PRICING => {
                    currency: "EUR", 
                    rent: rent
                }
            }

            reponse = post("updatePropertyPricingSetup", setup)

        end

        def self.post(name, params=nil)
            url = self.url_for(name)

            data = params.to_json

            # puts "[POST] #{name}: #{url} "
            # puts " --- data --- "
            # puts data

            KigoAPI::Response.new( RestClient.post url, data, :content_type => :json, :accept => :json )
        end

        def self.get(name)
            url = self.url_for(name)

            # puts "[GET] #{name}: #{url} "

            KigoAPI::Response.new( RestClient.get url_for(name), :content_type => :json, :accept => :json )
        end

        def self.url_for(name)
            "https://#{@@username}:#{@@password}@#{API_HOST}#{name}"
        end
    end
end