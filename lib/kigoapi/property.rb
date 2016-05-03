module KigoAPI
    class Property
        attr_accessor :prop_id
        attr_accessor :id

        MAPPING = {
            :name => :PROP_NAME,
            :street_no => :PROP_STREETNO,
            :addr1 => :PROP_ADDR1,
            :addr2 => :PROP_ADDR2,
            :city => :PROP_CITY,
            :country => :PROP_COUNTRY,
            :aptno => :PROP_APTNO,
            :postcode => :PROP_POSTCODE,
            :latlng => :PROP_LATLNG,
            :currency => :PROP_RATE_CURRENCY
        }

        def initialize(id=nil)
            self.id = self.prop_id = id

            MAPPING.keys.each do |key|
                create_method key do
                    @data ||= fetch
                    mapping = MAPPING[key]

                    if @data and @data[:PROP_INFO] and @data[:PROP_INFO].key? mapping
                        @data[:PROP_INFO][MAPPING[key]]
                    elsif @data and @data[:PROP_RATE] and @data[:PROP_RATE].key? mapping
                        @data[:PROP_RATE][MAPPING[key]]
                    else
                        nil
                    end
                end
            end
        end

        def address
            addr = "#{self.addr1} #{self.street_no}, #{self.city} #{self.postcode}"
        end

        private

        def fetch
            if self.prop_id
                @data ||= KigoAPI::Properties.load(self.prop_id)
            else
                nil
            end
        end

        def create_method(name, &block)
            self.class.send(:define_method, name, &block)
        end
    end
end
