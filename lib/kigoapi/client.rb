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

            response = RestClient.post url, data, { :content_type => :json, :accept => :json, verify_ssl: false }
            KigoAPI::Response.new(response)
        end

        def self.get(name)
            url = self.url_for(name)

            if @@debug
              puts "[GET] #{name}: #{url} "
            end

            response = RestClient.get url, { :content_type => :json, :accept => :json, verify_ssl: false }
            KigoAPI::Response.new(response)
        end

        def self.url_for(name)
          if @@username and @@password
            "https://#{@@username}:#{@@password}@#{API_HOST}#{name}"
          else
            "https://#{API_HOST}#{name}"
          end
        end
    end
end
