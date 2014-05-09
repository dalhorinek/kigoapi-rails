module KigoAPI
    class Client
        API_HOST = "app.kigo.net/api/ra/v1/"

        def self.debug=(bool)
            @@debug = bool
        end

        def self.debug
            @@debug
        end

        def self.auth(username, password)
            @@username = username
            @@password = password
        end


        def self.ping
            post("ping", "ping")
        end

        def self.post(name, params=nil)
            url = self.url_for(name)

            data = params.to_json

            if @@debug
              puts "[POST] #{name}: #{url} "
              puts " --- data --- "
              puts data
            end

            KigoAPI::Response.new( RestClient.post url, data, :content_type => :json, :accept => :json )
        end

        def self.get(name)
            url = self.url_for(name)

            if @@debug
              puts "[GET] #{name}: #{url} "
            end

            KigoAPI::Response.new( RestClient.get url_for(name), :content_type => :json, :accept => :json )
        end

        def self.url_for(name)
            "https://#{@@username}:#{@@password}@#{API_HOST}#{name}"
        end
    end
end
