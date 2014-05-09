module KigoAPI
    class Response
        def initialize(raw_data)
            if KigoAPI::Client.debug
              puts "[DEBUG RESPONSE]: #{raw_data}"
            end

            @data = JSON.parse(raw_data).deep_symbolize_keys
        end

        def status
            @data[:API_RESULT_CODE]
        end


        def ok
            self.status == "E_OK"
        end

        def result
            @data[:API_RESULT_TEXT]
        end

        def data
            # puts " -- response data -- "
            # puts @data[:API_REPLY]
            # puts " ------------------- "

            @reply ||= @data[:API_REPLY]
        end
    end
end
